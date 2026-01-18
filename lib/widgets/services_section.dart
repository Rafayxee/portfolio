import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/animation_utils.dart';
import '../utils/responsive.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Mobile App Development',
        'description':
            'Building high-performance, cross-platform mobile applications using Flutter for Android and iOS with stunning UI/UX.',
        'icon': FontAwesomeIcons.mobileScreen,
        'tags': ['Flutter', 'Android', 'iOS'],
        'color': const Color(0xFF0c7ff2),
      },
      {
        'title': 'Full-Stack Development',
        'description':
            'End-to-end application development with robust backend solutions using Node.js, Express, and cloud services.',
        'icon': FontAwesomeIcons.layerGroup,
        'tags': ['Node.js', 'Express', 'MongoDB'],
        'color': const Color(0xFF6366f1),
      },
      {
        'title': 'UI/UX Design',
        'description':
            'Creating beautiful, intuitive user interfaces with responsive designs and smooth animations.',
        'icon': FontAwesomeIcons.paintBrush,
        'tags': ['Figma', 'Responsive', 'Animations'],
        'color': const Color(0xFFec4899),
      },
      {
        'title': 'API Development',
        'description':
            'Designing and building RESTful APIs and integrating third-party services for seamless connectivity.',
        'icon': FontAwesomeIcons.code,
        'tags': ['REST', 'GraphQL', 'Integration'],
        'color': const Color(0xFF10b981),
      },
      {
        'title': 'Firebase & Cloud',
        'description':
            'Implementing cloud solutions with Firebase, Supabase, and other BaaS platforms for scalable applications.',
        'icon': FontAwesomeIcons.cloud,
        'tags': ['Firebase', 'Supabase', 'Cloud'],
        'color': const Color(0xFFf59e0b),
      },
      {
        'title': 'State Management',
        'description':
            'Implementing efficient state management patterns using GetX, BLoC, Provider, and Riverpod.',
        'icon': FontAwesomeIcons.gears,
        'tags': ['GetX', 'BLoC', 'Provider'],
        'color': const Color(0xFF8b5cf6),
      },
    ];

    final isMobile = ResponsiveUtils.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsivePadding(context),
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeSlideAnimation(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'WHAT I DO',
                  style: TextStyle(
                    color: Color(0xFF0c7ff2),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'My Services',
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
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'I provide comprehensive solutions to bring your ideas to life with cutting-edge technology and best practices.',
                    style: TextStyle(
                      color: const Color(0xFF9cabba),
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        mobile: 15,
                        tablet: 16,
                        desktop: 17,
                      ),
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // Services list - open layout without cards
          ...services.asMap().entries.map((entry) {
            final index = entry.key;
            final service = entry.value;
            return StaggeredListAnimation(
              index: index,
              staggerDelay: const Duration(milliseconds: 100),
              child: _buildServiceItem(
                service,
                isMobile,
                index == services.length - 1,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildServiceItem(
    Map<String, dynamic> service,
    bool isMobile,
    bool isLast,
  ) {
    final Color accentColor = service['color'] as Color;

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 24 : 32),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFF283039), width: 1),
              ),
      ),
      child: isMobile
          ? _buildMobileServiceItem(service, accentColor)
          : _buildDesktopServiceItem(service, accentColor),
    );
  }

  Widget _buildDesktopServiceItem(
    Map<String, dynamic> service,
    Color accentColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accentColor, accentColor.withValues(alpha: 0.6)],
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            service['icon'] as IconData,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 32),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service['title'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                service['description'] as String,
                style: const TextStyle(
                  color: Color(0xFF9cabba),
                  fontSize: 15,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 16),
              // Tags
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: (service['tags'] as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: accentColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileServiceItem(
    Map<String, dynamic> service,
    Color accentColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accentColor, accentColor.withValues(alpha: 0.6)],
            ),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            service['icon'] as IconData,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          service['title'] as String,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          service['description'] as String,
          style: const TextStyle(
            color: Color(0xFF9cabba),
            fontSize: 14,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 14),
        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (service['tags'] as List<String>).map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: accentColor.withValues(alpha: 0.3)),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  color: accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
