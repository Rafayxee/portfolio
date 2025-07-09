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
            child: Column(
              children: [
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: ResponsiveUtils.buildHeroContainer(
                      context: context,
                      child: HeroSection(key: controller.heroKey),
                    ),
                  ),
                ),

                SizedBox(
                  height: ResponsiveUtils.getVerticalSpacing(context) * 2,
                ),

                // Main content sections with better responsive layout
                _buildContentSection(
                  context: context,
                  child: ProjectsSection(key: controller.projectsKey),
                ),

                SizedBox(
                  height: ResponsiveUtils.getVerticalSpacing(context) * 2,
                ),

                _buildContentSection(
                  context: context,
                  child: SkillsSection(key: controller.skillsKey),
                ),

                SizedBox(
                  height: ResponsiveUtils.getVerticalSpacing(context) * 2,
                ),

                _buildContentSection(
                  context: context,
                  child: ExperienceSection(key: controller.experienceKey),
                ),

                SizedBox(
                  height: ResponsiveUtils.getVerticalSpacing(context) * 2,
                ),

                _buildContentSection(
                  context: context,
                  child: ContactSection(key: controller.contactKey),
                ),

                SizedBox(
                  height: ResponsiveUtils.getVerticalSpacing(context) * 2,
                ),
              ],
            ),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Container(
              padding: ResponsiveUtils.getSectionPadding(context),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFF283039), width: 1),
                ),
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveUtils.getMaxContentWidth(context),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '© 2024 Abdul Rafay. All rights reserved.',
                        style: TextStyle(
                          color: const Color(0xFF9cabba),
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                            context,
                            mobile: 14,
                            tablet: 14,
                            desktop: 15,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Designed with passion and Flutter.',
                        style: TextStyle(
                          color: const Color(0xFF9cabba),
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                            context,
                            mobile: 12,
                            tablet: 12,
                            desktop: 13,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build content sections with proper responsive layout
  Widget _buildContentSection({
    required BuildContext context,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.getMaxContentWidth(context),
          ),
          child: child,
        ),
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
