import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/animation_utils.dart';
import '../utils/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const _email = 'rafaymashoor@gmail.com';

  @override
  Widget build(BuildContext context) {
    return FadeSlideAnimation(
      child: Center(
        child: Column(
          children: [
            // Heading
            Text(
              "Let's Connect",
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  mobile: 32,
                  tablet: 40,
                  desktop: 48,
                ),
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle
            Container(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Text(
                "If you're looking to build an innovative mobile app or collaborate on an exciting project, feel free to reach out! I specialize in Flutter, Firebase, and scalable backend solutions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF9cabba),
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    mobile: 14,
                    tablet: 15,
                    desktop: 16,
                  ),
                  height: 1.7,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Email row
            _ContactInfoRow(
              icon: Icons.email_outlined,
              text: _email,
              onTap: () => launchUrl(Uri.parse('mailto:$_email')),
            ),
            const SizedBox(height: 40),
            // Social icons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIconButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: 'https://www.linkedin.com/in/abdul-rafay-mashoor',
                ),
                const SizedBox(width: 16),
                _SocialIconButton(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/Rafayxee',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Contact Info Row ────────────────────────────────────────────────────────

class _ContactInfoRow extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<_ContactInfoRow> createState() => _ContactInfoRowState();
}

class _ContactInfoRowState extends State<_ContactInfoRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: _isHovered
                  ? const Color(0xFF0c7ff2)
                  : const Color(0xFF9cabba),
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                color: _isHovered ? const Color(0xFF0c7ff2) : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                decoration: _isHovered
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: const Color(0xFF0c7ff2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Social Icon Button ──────────────────────────────────────────────────────

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIconButton({required this.icon, required this.url});

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(Uri.parse(widget.url));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFF0c7ff2).withValues(alpha: 0.15)
                : const Color(0xFF1b2127),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF0c7ff2)
                  : const Color(0xFF283039),
            ),
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              color: _isHovered ? const Color(0xFF0c7ff2) : Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
