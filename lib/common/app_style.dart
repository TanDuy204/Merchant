import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle titleLarge() => TextStyle(
        fontSize: 19.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle titleMedium() => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle titleXSmall() => TextStyle(
        fontSize: 15.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      );

  static TextStyle titleSmall() => TextStyle(
        fontSize: 13.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      );

  static TextStyle titleTini() => TextStyle(
        fontSize: 11.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      );

  static TextStyle bodyLarge() => TextStyle(
        fontSize: 17.sp,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle bodyMedium() => TextStyle(
        fontSize: 15.sp,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle bodySmall() => TextStyle(
        fontSize: 13.sp,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle bodyXSmall() => TextStyle(
        fontSize: 11.sp,
        color: Colors.black,
        fontFamily: 'Roboto',
      );

  static TextStyle buttonLabel() => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: 'Roboto',
      );
}

class AppColors {
  static const Color blueColor = Color(0xFF1565C0);
  static const Color lightBlueColor = Color(0xFF007AFF);

  static const Color redColor = Color(0xFFDC2626);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightWhiteColor = Color(0xFFE3F2FD);
  static const Color greyColor = Color(0xFF757575);

  static const Color deepBlue = Color(0xFF1867C1);
  static const Color lightBlue = Color(0xFF7FAFFD);
}
