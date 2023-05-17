import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_fan_integration/common/dialog.dart';
import 'package:task_fan_integration/pages/home/home_page.dart';
import 'package:task_fan_integration/pages/auth/signIn_student_page.dart';

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Widget widgetNow = SignInStudentPage();

  void checkLogin() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // Tambahkan pengecekan apakah email sudah diverifikasi atau belum
        if (user.emailVerified == true) {
          widgetNow = const HomePage();
          notifyListeners();
        }
      }
    });
  }

  void signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        if (user.emailVerified == true) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage(),
            ),
          );
        } else {
          // ignore: use_build_context_synchronously
          alertDialog(
            'Info',
            'Akun Anda belum diverifikasi. Silakan verifikasi email Anda.',
            DialogType.info,
            context,
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        alertDialog('Info', 'Email tidak ditemukan', DialogType.info, context);
      } else if (e.code == 'wrong-password') {
        alertDialog('Info', 'Password salah', DialogType.info, context);
      }
    }
  }

  void register(
      String email, String password, String name, BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      await user?.updateDisplayName(name);
      credential.user!.sendEmailVerification();
      // ignore: use_build_context_synchronously
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Info',
        desc: 'Berhasil Register, Silakan verifikasi email Anda',
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        alertDialog('Info', "Email Sudah Terdaftar", DialogType.info, context);
      }
    }
  }

  void resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      alertDialog('Info', "Periksa Email Untuk Reset Password", DialogType.info,
          context);
    } catch (e) {
      // Handle error
      print('Error sending password reset email: $e');
    }
  }

  void logout() {
    try {
      auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
