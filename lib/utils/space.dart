import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space {
  static getHeight(context) => MediaQuery.of(context).size.height;
  static getWidth(context) => MediaQuery.of(context).size.width;
  static addheight(double height) => SizedBox(height: height.h);
  static addwidth(double width) => SizedBox(width: width.w);
}
