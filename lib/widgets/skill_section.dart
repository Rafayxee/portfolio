import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Flutter', 'icon': FontAwesomeIcons.flutter},
      {'name': 'Dart', 'icon': FontAwesomeIcons.dartLang},
      {'name': 'Firebase', 'icon': Icons.cloud},
      {'name': 'REST APIs', 'icon': Icons.api},
      {'name': 'Git', 'icon': FontAwesomeIcons.git},
      {'name': 'UI/UX Design', 'icon': FontAwesomeIcons.uikit},
      {'name': 'State Management', 'icon': Icons.settings},
      {'name': 'Agile Development', 'icon': Icons.construction},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Core Skills',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.getGridCrossAxisCount(
              context,
              mobile: 2,
              tablet: 3,
              desktop: 4,
              largeDesktop: 6,
            ),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: ResponsiveUtils.isMobile(context) ? 1.0 : 1.2,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            final skill = skills[index];
            return _buildSkillCard(skill);
          },
        ),
      ],
    );
  }

  Widget _buildSkillCard(Map<String, dynamic> skill) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1b2127),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3b4754)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(skill['icon'], color: const Color(0xFF0c7ff2), size: 32),
          const SizedBox(height: 12),
          Text(
            skill['name'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
