// ignore_for_file: must_be_immutable

import 'package:attendance_app/services/color_theme.dart';
import 'package:attendance_app/services/text_theme.dart';
import 'package:attendance_app/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Txtbtn extends StatelessWidget {
  String text;
  Color? bgclr;
  Color? borderclr;
  Function navigator;
  TextStyle? textStyle;
  double radiuss;
  double? width;

  Txtbtn(
      {super.key,
      this.bgclr,
      required this.navigator,
      required this.text,
      this.textStyle,
      this.radiuss = 0,
      this.borderclr,
      this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: borderclr == null ? Colors.transparent : borderclr!),
              borderRadius: BorderRadius.circular(radiuss.r)),
          minimumSize:
              Size(width == null ? Space.getWidth(context) : width, 50.h),
          backgroundColor: bgclr == null ? Clr.orang : bgclr),
      onPressed: () => navigator(),
      child: Text(
        text,
        style: textStyle == null
            ? MyStyle.fs14Bold.copyWith(color: Clr.white, letterSpacing: 0.8)
            : textStyle,
      ),
    );
  }
}
