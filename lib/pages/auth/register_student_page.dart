// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_fan_integration/pages/auth/auth_view_model.dart';
import '../../theme.dart';

class RegisterStudentPage extends StatelessWidget {
  RegisterStudentPage({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController confirmPassC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffFAFAFA),
          elevation: 0,
          title: Text(
            'Register',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black, // mengubah warna ikon back menjadi hitam
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 36,
                bottom: 36,
                left: 51,
                right: 51,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/logo.png',
                      width: 150,
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Text(
                        'Silahkan Daftar',
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: emailC,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: 'Email',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Email tidak boleh kosong';
                        }

                        final regex = RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                        if (!regex.hasMatch(value!)) {
                          return 'Email tidak valid';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: nameC,
                      obscureText: false,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: 'Nama',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Nama tidak boleh kosong';
                        }

                        if (value!.length < 3) {
                          return 'Nama minimal 3 huruf';
                        }

                        if (value.length > 50) {
                          return 'Nama maksimal 50 huruf';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: passC,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: 'Password',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Password tidak boleh kosong';
                        }

                        if (value!.length < 8) {
                          return 'harus terdiri dari minimal 8 karakter';
                        }

                        final isUppercasePresent =
                            value.contains(RegExp(r'[A-Z]'));
                        final isLowercasePresent =
                            value.contains(RegExp(r'[a-z]'));
                        final isNumberPresent =
                            value.contains(RegExp(r'[0-9]'));

                        if (!isUppercasePresent ||
                            !isLowercasePresent ||
                            !isNumberPresent) {
                          return 'Setidaknya satu huruf besar, satu huruf kecil, dan satu angka';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: confirmPassC,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        labelText: 'Konfirmasi Password',
                        labelStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Konfirmasi password tidak boleh kosong';
                        }

                        if (value != passC.text) {
                          return 'Password tidak sama';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final viewModel = Provider.of<AuthViewModel>(context,
                              listen: false);
                          viewModel.register(
                              emailC.text, passC.text, nameC.text, context);
                          emailC.clear();
                          passC.clear();
                          confirmPassC.clear();
                          nameC.clear();
                        }
                      },
                      child: Container(
                        height: 37,
                        width: 128,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                          'Daftar',
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
