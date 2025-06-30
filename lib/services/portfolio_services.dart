import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../models/experience.dart';
import '../models/projects.dart';
import '../models/skills.dart';

class PortfolioService extends GetxService {
  List<Project> getProjects() {
    return [
      Project(
        title: 'Mobile App for Fitness Tracking',
        description:
            'A comprehensive fitness tracking app with user authentication, workout logging, progress visualization, and social features.',
        imageUrl:
            'https://via.placeholder.com/400x200/0c7ff2/FFFFFF?text=Fitness+App',
        technologies: ['Flutter', 'Firebase', 'Dart', 'Provider'],
        githubUrl: 'https://github.com/alexturner/fitness-app',
        liveUrl: 'https://play.google.com/store/apps/fitness-tracker',
      ),
      Project(
        title: 'E-commerce App with Flutter',
        description:
            'A full-featured e-commerce application with product listings, shopping cart, secure payment integration, and order management.',
        imageUrl:
            'https://via.placeholder.com/400x200/10b981/FFFFFF?text=E-commerce',
        technologies: ['Flutter', 'GetX', 'Stripe', 'REST API'],
        githubUrl: 'https://github.com/alexturner/ecommerce-app',
        liveUrl: 'https://apps.apple.com/app/ecommerce-flutter',
      ),
      Project(
        title: 'Social Media App with Real-time Updates',
        description:
            'A modern social media platform with user profiles, posts, real-time messaging, and live updates using Firebase.',
        imageUrl:
            'https://via.placeholder.com/400x200/8b5cf6/FFFFFF?text=Social+Media',
        technologies: ['Flutter', 'Firebase', 'Cloud Functions', 'WebSocket'],
        githubUrl: 'https://github.com/alexturner/social-app',
        liveUrl: 'https://social-flutter-app.web.app',
      ),
    ];
  }

  List<Skill> getSkills() {
    return [
      Skill(
        name: 'Flutter',
        icon: FontAwesomeIcons.flutter,
        proficiency: 0.95,
        category: 'Framework',
      ),
      Skill(
        name: 'Dart',
        icon: FontAwesomeIcons.dartLang,
        proficiency: 0.9,
        category: 'Language',
      ),
      Skill(
        name: 'Firebase',
        icon: Icons.cloud,
        proficiency: 0.85,
        category: 'Backend',
      ),
      Skill(
        name: 'REST APIs',
        icon: Icons.api,
        proficiency: 0.88,
        category: 'Integration',
      ),
      Skill(
        name: 'Git',
        icon: FontAwesomeIcons.git,
        proficiency: 0.82,
        category: 'Tools',
      ),
      Skill(
        name: 'UI/UX Design',
        icon: Icons.design_services,
        proficiency: 0.78,
        category: 'Design',
      ),
      Skill(
        name: 'State Management',
        icon: Icons.settings,
        proficiency: 0.92,
        category: 'Architecture',
      ),
      Skill(
        name: 'Agile Development',
        icon: Icons.construction,
        proficiency: 0.85,
        category: 'Methodology',
      ),
    ];
  }

  List<Experience> getExperiences() {
    return [
      Experience(
        title: 'Freelance Flutter Developer',
        company: 'Self-Employed',
        period: '2021 - Present',
        description:
            'Developed and maintained multiple cross-platform mobile applications for diverse clients, focusing on performance, usability, and clean code architecture.',
        icon: Icons.work,
        achievements: [
          'Delivered 15+ mobile applications to satisfied clients',
          'Maintained 98% client satisfaction rate',
          'Reduced development time by 30% through reusable components',
        ],
      ),
      Experience(
        title: 'Mobile App Developer',
        company: 'Tech Innovators Inc.',
        period: '2019 - 2021',
        description:
            'Contributed to the development of flagship mobile products, collaborating with designers and backend engineers to deliver high-quality features.',
        icon: Icons.business_center,
        achievements: [
          'Led development of main mobile app with 100K+ downloads',
          'Implemented CI/CD pipeline reducing deployment time by 50%',
          'Mentored 3 junior developers in Flutter best practices',
        ],
      ),
      Experience(
        title: 'Software Engineering Intern',
        company: 'Future Tech Solutions',
        period: 'Summer 2018',
        description:
            'Assisted senior developers in various stages of the software development lifecycle, gaining hands-on experience with Flutter and mobile development best practices.',
        icon: Icons.school,
        achievements: [
          'Completed 2 major feature implementations',
          'Improved app performance by 25% through optimization',
          'Received outstanding intern evaluation',
        ],
      ),
    ];
  }
}
