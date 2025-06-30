import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/responsive.dart';

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
      },
      {
        'title': 'KUCHBHI',
        'description':
            'Developed a feature-rich classified app using Flutter, enabling users to seamlessly buy, sell,and bid on products.',
        'image': 'assets/images/kuchbhi.png',
        'url':
            'https://play.google.com/store/apps/details?id=com.kuch_bhi.usmankazi',
      },
      {
        'title': 'Pictures',
        'description':
            'Pictures, a unique platform and mobile application dedicated to showcasing exceptional talent through photography.',
        'image': 'assets/images/pictures.jpeg',
        'url':
            'https://play.google.com/store/apps/details?id=com.magma3c.pictures',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Featured Projects',
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
              mobile: 1,
              tablet: 2,
              desktop: 3,
              largeDesktop: 3,
            ),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: ResponsiveUtils.isMobile(context) ? 1.2 : 0.8,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(project['url']!))) {
                  await launchUrl(Uri.parse(project['url']!));
                } else {
                  throw 'Could not launch ${project['url']}';
                }
              },
              child: _buildProjectCard(project),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, String> project) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1b2127),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF283039)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(project['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      project['description']!,
                      style: const TextStyle(
                        color: Color(0xFF9cabba),
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
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
