import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'title': 'Mobile App Developer (Flutter) at MAGMA3C',
        'period': '2024 - Present',
        'description':
            'I specialize in creating high-performance mobile applications using Flutter, integrating Firebase (serverless solutions) and Node.js (custom APIs) to build full-stack solutions. My focus is on developing smooth, scalable, and user-centric apps with clean architecture.',
        'icon': Icons.work,
      },
      {
        'title': 'Mobile App Developer Intern (Flutter) at CrossCode',
        'period': ' Aug 2022 - Jan 2023',
        'description':
            'During my six-month internship, I gained hands-on experience in Flutter app development, mastering widgets, state management, and API integration. I worked on real-world projects, utilizing Firebase as a backend and Git for version control',
        'icon': Icons.business_center,
      },
      {
        'title': 'University of Lahore',
        'period': 'Bachelors of Science in Computer Science (Bscs)',
        'description': 'Lahore',
        'icon': FontAwesomeIcons.userGraduate,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Work Experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            final experience = experiences[index];
            return _buildExperienceItem(
              experience,
              index == experiences.length - 1,
            );
          },
        ),
      ],
    );
  }

  Widget _buildExperienceItem(Map<String, dynamic> experience, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF0c7ff2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(experience['icon'], color: Colors.white, size: 24),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 80,
                color: const Color(0xFF3b4754),
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  experience['period'],
                  style: const TextStyle(
                    color: Color(0xFF9cabba),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  experience['description'],
                  style: const TextStyle(
                    color: Color(0xFF9cabba),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
