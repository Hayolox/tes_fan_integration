import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void alertDialog(String title, String description, DialogType dialogType,
    BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: description,
    btnOkOnPress: () {},
  ).show();
}
