import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/portfolio_controller.dart';
import '../utils/responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();
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

    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color(0xFF111418).withOpacity(0.8),
      elevation: 0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111418).withOpacity(0.8),
          border: const Border(
            bottom: BorderSide(color: Color(0xFF283039), width: 1),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: ResponsiveUtils.getMaxContentWidth(context),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.getResponsivePadding(context),
                ),
                child: Row(
                  children: [
                    // Logo and title
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: const FaIcon(
                            FontAwesomeIcons.mobile,
                            color: Color(0xFF0c7ff2),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'RM.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context,
                              mobile: 18,
                              tablet: 20,
                              desktop: 20,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Navigation items (desktop/tablet only)
                    if (ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isDesktop(context)) ...[
                      _buildNavItem('Projects', 'projects', controller),
                      const SizedBox(width: 32),
                      _buildNavItem('Skills', 'skills', controller),
                      const SizedBox(width: 32),
                      _buildNavItem('Experience', 'experience', controller),
                      const SizedBox(width: 32),
                      _buildNavItem('Contact', 'contact', controller),
                      const SizedBox(width: 32),
                    ],

                    // Social links (always visible)
                    if (ResponsiveUtils.isDesktop(context)) ...[
                      Row(
                        children: [
                          _buildSocialButton(
                            FontAwesomeIcons.linkedin,
                            _launcLinkedIn,
                          ),
                          const SizedBox(width: 12),
                          _buildSocialButton(
                            FontAwesomeIcons.github,
                            _launchGithub,
                          ),
                          // const SizedBox(width: 12),
                          // _buildSocialButton(Icons.business, () {}),
                        ],
                      ),
                    ],

                    // Mobile menu button
                    // if (ResponsiveUtils.isMobile(context)) ...[
                    //   const SizedBox(width: 16),
                    //   Builder(
                    //     builder: (context) => IconButton(
                    //       onPressed: () => Scaffold.of(context).openEndDrawer(),
                    //       icon: const Icon(Icons.menu, color: Colors.white),
                    //     ),
                    //   ),
                    // ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String title,
    String section,
    PortfolioController controller,
  ) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.scrollToSection(section),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedSection.value == section
                  ? const Color(0xFF0c7ff2)
                  : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
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
