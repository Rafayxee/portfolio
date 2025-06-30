import 'package:flutter/material.dart';

class ResponsiveUtils {
  // Enhanced breakpoints for better web support
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;
  static bool isUltraWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1920;

  static double getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920) return 320; // Ultra-wide screens
    if (width >= 1440) return 240; // Large desktop
    if (width >= 1024) return 160; // Desktop
    if (width >= 768) return 80; // Tablet
    return 40; // Mobile
  }

  static double getMaxContentWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200 ? 1200 : double.infinity;
  }

  static int getGridCrossAxisCount(
    BuildContext context, {
    int mobile = 1,
    int tablet = 2,
    int desktop = 3,
    int largeDesktop = 4,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1440) return largeDesktop;
    if (width >= 1024) return desktop;
    if (width >= 768) return tablet;
    return mobile;
  }

  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context)) return tablet;
    return mobile;
  }
}
