// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_fan_integration/pages/auth/auth_view_model.dart';
import '../../theme.dart';

class ForgetPasswordStudentPage extends StatelessWidget {
  ForgetPasswordStudentPage({super.key});
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffFAFAFA),
          elevation: 0,
          title: Text(
            'Lupa Password',
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
                    const SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Text(
                        'Lupa Password',
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
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final authViewModel = Provider.of<AuthViewModel>(
                              context,
                              listen: false);
                          authViewModel.resetPassword(emailC.text, context);
                          emailC.clear();
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
                          'Kirim',
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
