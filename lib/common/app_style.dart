import 'package:flutter/material.dart';

class AppTextStyles {
  static double _getResponsiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 375) {
      return baseSize * 0.70;
    } else if (screenWidth < 400) {
      return baseSize * 0.75;
    } else if (screenWidth < 480) {
      return baseSize * 0.83;
    } else if (screenWidth < 600) {
      return baseSize;
    } else if (screenWidth < 850) {
      return baseSize * 1.4;
    } else {
      return baseSize * 1.8;
    }
  }

  static TextStyle titleLarge(BuildContext context) => TextStyle(
      fontSize: _getResponsiveFontSize(context, 26),
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static TextStyle titleMedium(BuildContext context) => TextStyle(
      fontSize: _getResponsiveFontSize(context, 22),
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static TextStyle titleXSmall(BuildContext context) => TextStyle(
      fontSize: _getResponsiveFontSize(context, 20),
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle titleSmall(BuildContext context) => TextStyle(
      fontSize: _getResponsiveFontSize(context, 18),
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle titleTini(BuildContext context) => TextStyle(
      fontSize: _getResponsiveFontSize(context, 13),
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle bodyLarge(BuildContext context) => TextStyle(
        fontSize: _getResponsiveFontSize(context, 22),
        color: Colors.black,
      );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
        fontSize: _getResponsiveFontSize(context, 19),
        color: Colors.black,
      );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
        fontSize: _getResponsiveFontSize(context, 17),
        color: Colors.black,
      );
  static TextStyle bodyXSmall(BuildContext context) => TextStyle(
        fontSize: _getResponsiveFontSize(context, 16),
        color: Colors.black,
      );

  static TextStyle buttonLabel(BuildContext context) => TextStyle(
        fontSize: _getResponsiveFontSize(context, 20),
        fontWeight: FontWeight.w500,
        color: Colors.white,
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
