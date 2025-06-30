import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyles {
  static final TextStyle heading1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 40,
    fontWeight: FontWeight.w900,
    height: 1.1,
  );

  static const TextStyle heading2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle heading3 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body1 = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
    height: 1.6,
  );

  static const TextStyle body2 = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    height: 1.4,
  );
}
