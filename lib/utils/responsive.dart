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

  // More conservative padding for desktop
  static double getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920) return 120; // Ultra-wide screens - reduced from 320
    if (width >= 1440) return 80; // Large desktop - reduced from 240
    if (width >= 1024) return 60; // Desktop - reduced from 160
    if (width >= 768) return 40; // Tablet - reduced from 80
    return 20; // Mobile - reduced from 40
  }

  // Better content width management
  static double getMaxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920) return 1400; // Ultra-wide
    if (width >= 1440) return 1200; // Large desktop
    if (width >= 1024) return 1000; // Desktop
    return double.infinity; // Mobile and tablet use full width
  }

  // Container width for hero sections
  static double getHeroSectionWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1440) return 900; // Large desktop
    if (width >= 1024) return 800; // Desktop
    if (width >= 768) return 600; // Tablet
    return double.infinity; // Mobile
  }

  // Profile section specific layout
  static bool shouldUseHorizontalProfileLayout(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  // Side padding for sections
  static EdgeInsets getSectionPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920)
      return const EdgeInsets.symmetric(horizontal: 120, vertical: 40);
    if (width >= 1440)
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 32);
    if (width >= 1024)
      return const EdgeInsets.symmetric(horizontal: 60, vertical: 24);
    if (width >= 768)
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 20);
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 16);
  }

  // Card padding
  static EdgeInsets getCardPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) return const EdgeInsets.all(32);
    if (width >= 768) return const EdgeInsets.all(24);
    return const EdgeInsets.all(16);
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

  // Spacing utilities
  static double getVerticalSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) return 32;
    if (width >= 768) return 24;
    return 16;
  }

  static double getHorizontalSpacing(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) return 24;
    if (width >= 768) return 16;
    return 12;
  }

  // Profile image size
  static double getProfileImageSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) return 200;
    if (width >= 768) return 150;
    return 120;
  }

  // Layout helpers
  static Widget buildResponsiveContainer({
    required BuildContext context,
    required Widget child,
    bool useMaxWidth = true,
  }) {
    return Container(
      constraints: useMaxWidth
          ? BoxConstraints(maxWidth: getMaxContentWidth(context))
          : null,
      margin: EdgeInsets.symmetric(horizontal: getResponsivePadding(context)),
      child: child,
    );
  }

  // Hero section container
  static Widget buildHeroContainer({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: getHeroSectionWidth(context)),
      margin: EdgeInsets.symmetric(horizontal: getResponsivePadding(context)),
      child: child,
    );
  }
}
