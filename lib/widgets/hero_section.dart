import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/portfolio_controller.dart';
import '../utils/animation_utils.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return FadeSlideAnimation(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context),
          vertical: isMobile ? 40 : 60,
        ),
        child: isMobile
            ? _buildMobileLayout(controller, context)
            : _buildDesktopLayout(controller, context, isTablet),
      ),
    );
  }

  Widget _buildDesktopLayout(
    PortfolioController controller,
    BuildContext context,
    bool isTablet,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left content
        Expanded(flex: 3, child: _buildContent(controller, false, context)),
        const SizedBox(width: 60),
        // Right side - Profile image
        Expanded(flex: 2, child: _buildProfileImage(isTablet ? 280 : 320)),
      ],
    );
  }

  Widget _buildMobileLayout(
    PortfolioController controller,
    BuildContext context,
  ) {
    return Column(
      children: [
        _buildProfileImage(180),
        const SizedBox(height: 40),
        _buildContent(controller, true, context),
      ],
    );
  }

  Widget _buildProfileImage(double size) {
    return Center(
      child: FloatingAnimation(
        distance: 10,
        duration: const Duration(seconds: 4),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0c7ff2).withValues(alpha: 0.3),
                const Color(0xFF6366f1).withValues(alpha: 0.3),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0c7ff2).withValues(alpha: 0.25),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profilepic.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    PortfolioController controller,
    bool isMobile,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Section label
        Text(
          'WHO I AM',
          style: TextStyle(
            color: const Color(0xFF0c7ff2),
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 16),
        // Greeting
        Text(
          '👋 Hello, I\'m',
          style: TextStyle(
            color: const Color(0xFF9cabba),
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 18,
              tablet: 20,
              desktop: 22,
            ),
            fontWeight: FontWeight.w400,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 8),
        // Name
        Text(
          'Abdul Rafay Mashoor',
          style: TextStyle(
            color: Colors.white,
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 36,
              tablet: 48,
              desktop: 56,
            ),
            fontWeight: FontWeight.w900,
            height: 1.1,
            letterSpacing: -1,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        // Animated Role with gradient
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF0c7ff2), Color(0xFF6366f1)],
              ).createShader(bounds),
              child: AnimatedTypingText(
                texts: const ['Flutter Developer', 'Mobile App Expert'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    mobile: 20,
                    tablet: 24,
                    desktop: 28,
                  ),
                  fontWeight: FontWeight.w700,
                ),
                typingSpeed: const Duration(milliseconds: 80),
                pauseDuration: const Duration(seconds: 2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        // Description
        Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 600,
          ),
          child: Text(
            'Experienced Flutter Developer focused on crafting high-performance mobile apps for Android and iOS. With expertise in Firebase, Node.js, and backend integration, I build scalable, user-centric apps that provide seamless experiences.',
            style: TextStyle(
              color: const Color(0xFF9cabba),
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                mobile: 15,
                tablet: 16,
                desktop: 17,
              ),
              height: 1.8,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 40),
        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildButton(
              'View Projects',
              Icons.rocket_launch,
              true,
              () => controller.scrollToSection('projects'),
            ),
            _buildButton(
              'Contact Me',
              Icons.mail_outline,
              false,
              () => controller.scrollToSection('contact'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    IconData icon,
    bool isPrimary,
    VoidCallback onTap,
  ) {
    return HoverScaleWidget(
      scale: 1.05,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF0c7ff2), Color(0xFF6366f1)],
                )
              : null,
          color: isPrimary ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isPrimary
              ? null
              : Border.all(color: const Color(0xFF3b4754), width: 1.5),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFF0c7ff2).withValues(alpha: 0.4),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
