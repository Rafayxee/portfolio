import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/portfolio_controller.dart';
import '../utils/responsive.dart';

/// Fixed vertical sidebar navigation on the right side of the screen.
/// Shows section labels vertically with active state tracking.
/// Hidden on mobile — falls back to hamburger icon in the top bar.
class SidebarNav extends StatelessWidget {
  const SidebarNav({super.key});

  static const _sections = [
    ('Home', 'hero'),
    ('Services', 'services'),
    ('Projects', 'projects'),
    ('Skills', 'skills'),
    ('Experience', 'experience'),
    ('Contact', 'contact'),
  ];

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) return const SizedBox.shrink();

    final controller = Get.find<PortfolioController>();

    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: SizedBox(
        width: 48,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Section labels
            ..._sections.map((section) {
              final (label, key) = section;
              return _SidebarNavItem(
                label: label,
                sectionKey: key,
                controller: controller,
              );
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SidebarNavItem extends StatefulWidget {
  final String label;
  final String sectionKey;
  final PortfolioController controller;

  const _SidebarNavItem({
    required this.label,
    required this.sectionKey,
    required this.controller,
  });

  @override
  State<_SidebarNavItem> createState() => _SidebarNavItemState();
}

class _SidebarNavItemState extends State<_SidebarNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isActive =
          widget.controller.selectedSection.value == widget.sectionKey;

      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => widget.controller.scrollToSection(widget.sectionKey),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Active indicator line
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 2,
                  height: isActive ? 20 : (_isHovered ? 14 : 0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0c7ff2),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(width: 6),
                // Rotated label
                RotatedBox(
                  quarterTurns: 1,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: TextStyle(
                      color: isActive
                          ? const Color(0xFF0c7ff2)
                          : (_isHovered
                                ? Colors.white
                                : const Color(
                                    0xFF9cabba,
                                  ).withValues(alpha: 0.6)),
                      fontSize: 10,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                      letterSpacing: 2,
                      fontFamily: 'SpaceGrotesk',
                    ),
                    child: Text(widget.label.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// ─── Sidebar Social Icon ─────────────────────────────────────────────────────
