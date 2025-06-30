import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/portfolio_controller.dart';
import '../utils/responsive.dart';
import '../widgets/contact_section.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/project_section.dart';
import '../widgets/skill_section.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortfolioController());

    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: const Color(0xFF111418),
      endDrawer: ResponsiveUtils.isMobile(context)
          ? _buildMobileDrawer(controller)
          : null,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          CustomAppBar(),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveUtils.getMaxContentWidth(context),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtils.getResponsivePadding(context),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      HeroSection(key: controller.heroKey),
                      const SizedBox(height: 64),
                      ProjectsSection(key: controller.projectsKey),
                      const SizedBox(height: 64),
                      SkillsSection(key: controller.skillsKey),
                      const SizedBox(height: 64),
                      ExperienceSection(key: controller.experienceKey),
                      const SizedBox(height: 64),
                      ContactSection(key: controller.contactKey),
                      const SizedBox(height: 64),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFF283039), width: 1),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    '© 2024 Abdul Rafay. All rights reserved.',
                    style: TextStyle(color: Color(0xFF9cabba), fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Designed with passion and Flutter.',
                    style: TextStyle(color: Color(0xFF9cabba), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(PortfolioController controller) {
    return Drawer(
      backgroundColor: const Color(0xFF1b2127),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Navigation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildDrawerItem('Projects', 'projects', Icons.work, controller),
            _buildDrawerItem('Skills', 'skills', Icons.star, controller),
            _buildDrawerItem(
              'Experience',
              'experience',
              Icons.timeline,
              controller,
            ),
            _buildDrawerItem(
              'Contact',
              'contact',
              Icons.contact_mail,
              controller,
            ),
            const Spacer(),
            const Divider(color: Color(0xFF283039)),
            _buildSocialLinks(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    String title,
    String section,
    IconData icon,
    PortfolioController controller,
  ) {
    return Obx(
      () => ListTile(
        leading: Icon(
          icon,
          color: controller.selectedSection.value == section
              ? const Color(0xFF0c7ff2)
              : Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: controller.selectedSection.value == section
                ? const Color(0xFF0c7ff2)
                : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          controller.scrollToSection(section);
          Navigator.of(Get.context!).pop();
        },
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialIcon(FontAwesomeIcons.linkedin, _launcLinkedIn),
        _buildSocialIcon(FontAwesomeIcons.github, _launchGithub),
        // _buildSocialIcon(Icons.business, () {}),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF283039),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

_launcLinkedIn() async {
  const url = 'https://www.linkedin.com/in/abdul-rafay-mashoor-4b0934242';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

_launchGithub() async {
  const url = 'https://github.com/Rafayxee';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
