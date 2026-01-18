import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/animation_utils.dart';
import '../utils/responsive.dart';
import '../widgets/glassmorphism.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'MobileMate',
        'description':
            'Whether you are hunting for the latest smartphone, need to diagnose your device, or want to buy and sell phones. MobileMate makes it seamless and simple.',
        'image': 'assets/images/mobilemate.png',
        'url':
            'https://play.google.com/store/apps/details?id=com.magma3c.mobilemate',
        'tags': ['Flutter', 'Firebase', 'GetX'],
      },
      {
        'title': 'KUCHBHI',
        'description':
            'Developed a feature-rich classified app using Flutter, enabling users to seamlessly buy, sell, and bid on products.',
        'image': 'assets/images/kuchbhi.png',
        'url':
            'https://play.google.com/store/apps/details?id=com.kuch_bhi.usmankazi',
        'tags': ['Flutter', 'Firebase', 'REST API'],
      },
      {
        'title': 'Pictures',
        'description':
            'Pictures, a unique platform and mobile application dedicated to showcasing exceptional talent through photography.',
        'image': 'assets/images/pictures.jpeg',
        'url':
            'https://play.google.com/store/apps/details?id=com.magma3c.pictures',
        'tags': ['Flutter', 'Cloud Storage', 'Social'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeSlideAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'MY WORK',
                  style: TextStyle(
                    color: Color(0xFF0c7ff2),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Featured Projects',
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
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'Check out some of my recent projects that showcase my expertise in mobile app development.',
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
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.getGridCrossAxisCount(
              context,
              mobile: 1,
              tablet: 2,
              desktop: 3,
              largeDesktop: 3,
            ),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: ResponsiveUtils.isMobile(context) ? 0.85 : 0.75,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return StaggeredListAnimation(
              index: index,
              child: _buildProjectCard(project),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return ModernDarkCard(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(16),
      onTap: () async {
        final url = project['url'] as String;
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with overlay
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    project['image'] as String,
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
                // View Project Button
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0c7ff2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0c7ff2).withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.open_in_new, color: Colors.white, size: 14),
                        SizedBox(width: 6),
                        Text(
                          'View',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      project['description'] as String,
                      style: const TextStyle(
                        color: Color(0xFF9cabba),
                        fontSize: 13,
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tech Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: (project['tags'] as List<String>).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF0c7ff2,
                          ).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Color(0xFF0c7ff2),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
