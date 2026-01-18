import 'dart:ui';
import 'package:flutter/material.dart';

/// A glassmorphism card widget with frosted glass effect
class GlassmorphismCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final Color? glowColor;
  final bool showGlow;

  const GlassmorphismCard({
    super.key,
    required this.child,
    this.blur = 10,
    this.opacity = 0.1,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1,
    this.padding,
    this.glowColor,
    this.showGlow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        boxShadow: [
          if (showGlow)
            BoxShadow(
              color: (glowColor ?? const Color(0xFF0c7ff2)).withValues(
                alpha: 0.2,
              ),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: opacity),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              border: Border.all(
                color: borderColor ?? Colors.white.withValues(alpha: 0.2),
                width: borderWidth,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: opacity * 1.5),
                  Colors.white.withValues(alpha: opacity * 0.5),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A modern dark card with subtle gradient and glow effects
class ModernDarkCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool enableHover;
  final Color? accentColor;

  const ModernDarkCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.enableHover = true,
    this.accentColor,
  });

  @override
  State<ModernDarkCard> createState() => _ModernDarkCardState();
}

class _ModernDarkCardState extends State<ModernDarkCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = widget.accentColor ?? const Color(0xFF0c7ff2);

    return MouseRegion(
      onEnter: widget.enableHover
          ? (_) => setState(() => _isHovered = true)
          : null,
      onExit: widget.enableHover
          ? (_) => setState(() => _isHovered = false)
          : null,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            color: const Color(0xFF1b2127),
            border: Border.all(
              color: _isHovered
                  ? accentColor.withValues(alpha: 0.5)
                  : const Color(0xFF283039),
              width: _isHovered ? 1.5 : 1,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.15),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              BoxShadow(
                color: Colors.black.withValues(alpha: _isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1b2127),
                _isHovered ? const Color(0xFF1f2731) : const Color(0xFF1b2127),
              ],
            ),
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0.0, -5.0, 0.0))
              : Matrix4.identity(),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Gradient accent border card
class GradientBorderCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final List<Color>? gradientColors;
  final BorderRadius? borderRadius;

  const GradientBorderCard({
    super.key,
    required this.child,
    this.padding,
    this.gradientColors,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors =
        gradientColors ?? [const Color(0xFF0c7ff2), const Color(0xFF6366f1)];

    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      padding: const EdgeInsets.all(1.5),
      child: Container(
        padding: padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(14.5),
          color: const Color(0xFF1b2127),
        ),
        child: child,
      ),
    );
  }
}
