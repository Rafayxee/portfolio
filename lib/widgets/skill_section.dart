import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/animation_utils.dart';
import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skillCategories = [
      {
        'category': 'Mobile Development',
        'skills': [
          {
            'name': 'Flutter',
            'icon': FontAwesomeIcons.flutter,
            'color': const Color(0xFF02569B),
          },
          {
            'name': 'Dart',
            'icon': FontAwesomeIcons.dartLang,
            'color': const Color(0xFF0175C2),
          },
          {
            'name': 'Android',
            'icon': FontAwesomeIcons.android,
            'color': const Color(0xFF3DDC84),
          },
          {
            'name': 'iOS',
            'icon': FontAwesomeIcons.apple,
            'color': const Color(0xFF999999),
          },
        ],
      },
      {
        'category': 'Backend & Cloud',
        'skills': [
          {
            'name': 'Firebase',
            'icon': FontAwesomeIcons.fire,
            'color': const Color(0xFFFFA000),
          },
          {
            'name': 'Node.js',
            'icon': FontAwesomeIcons.nodeJs,
            'color': const Color(0xFF339933),
          },
          {
            'name': 'MongoDB',
            'icon': FontAwesomeIcons.database,
            'color': const Color(0xFF47A248),
          },
          {
            'name': 'REST APIs',
            'icon': FontAwesomeIcons.code,
            'color': const Color(0xFF10b981),
          },
        ],
      },
      {
        'category': 'State Management',
        'skills': [
          {
            'name': 'GetX',
            'icon': FontAwesomeIcons.g,
            'color': const Color(0xFF8b5cf6),
          },
          {
            'name': 'BLoC',
            'icon': FontAwesomeIcons.cubes,
            'color': const Color(0xFF0c7ff2),
          },
          {
            'name': 'Provider',
            'icon': FontAwesomeIcons.p,
            'color': const Color(0xFF6366f1),
          },
          {
            'name': 'Riverpod',
            'icon': FontAwesomeIcons.r,
            'color': const Color(0xFF00B4D8),
          },
        ],
      },
      {
        'category': 'Tools & Others',
        'skills': [
          {
            'name': 'Git',
            'icon': FontAwesomeIcons.git,
            'color': const Color(0xFFF05032),
          },
          {
            'name': 'Figma',
            'icon': FontAwesomeIcons.figma,
            'color': const Color(0xFFec4899),
          },
          {
            'name': 'VS Code',
            'icon': FontAwesomeIcons.code,
            'color': const Color(0xFF007ACC),
          },
          {
            'name': 'Agile',
            'icon': FontAwesomeIcons.repeat,
            'color': const Color(0xFFf59e0b),
          },
        ],
      },
    ];

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
                  'TECH STACK',
                  style: TextStyle(
                    color: Color(0xFF0c7ff2),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Skills & Expertise',
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
                    'Technologies and tools I use to bring products to life.',
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
          // Skills by category - all left aligned
          ...skillCategories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            return StaggeredListAnimation(
              index: index,
              staggerDelay: const Duration(milliseconds: 150),
              child: _buildSkillCategory(category, context),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    Map<String, dynamic> category,
    BuildContext context,
  ) {
    final skills = category['skills'] as List<Map<String, dynamic>>;
    final isMobile = ResponsiveUtils.isMobile(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category title with accent line
          Row(
            children: [
              Container(
                width: 4,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF0c7ff2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                category['category'] as String,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Skills as chips - left aligned
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.start,
            children: skills.map((skill) => _buildSkillChip(skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(Map<String, dynamic> skill) {
    final Color color = skill['color'] as Color;

    return HoverScaleWidget(
      scale: 1.05,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF1b2127),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF283039)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(skill['icon'] as IconData, color: color, size: 16),
            ),
            const SizedBox(width: 10),
            Text(
              skill['name'] as String,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
