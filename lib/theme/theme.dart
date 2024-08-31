import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.green;
  static const Color secondaryColor = Colors.teal;
  static const Color accentColor = Colors.orange;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
}

// Define your custom text styles
class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
  );
}
