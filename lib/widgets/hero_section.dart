import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/portfolio_controller.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PortfolioController>();

    return Container(
      padding: EdgeInsets.all(Get.width > 768 ? 48 : 32),
      decoration: BoxDecoration(
        color: const Color(0xFF1b2127),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF283039)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Get.width > 768
          ? Row(
              children: [
                Expanded(flex: 1, child: _buildImage()),
                const SizedBox(width: 32),
                Expanded(flex: 2, child: _buildContent(controller)),
              ],
            )
          : Column(
              children: [
                _buildImage(),
                const SizedBox(height: 32),
                _buildContent(controller),
              ],
            ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Container(
        width: Get.width > 768 ? 224 : 192,
        height: Get.width > 768 ? 224 : 192,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF0c7ff2), width: 4),
          image: const DecorationImage(
            image: AssetImage('assets/images/profilepic.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(PortfolioController controller) {
    return Column(
      crossAxisAlignment: Get.width > 768
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Abdul Rafay Mashoor',
          style: TextStyle(
            color: Colors.white,
            fontSize: Get.width > 768 ? 40 : 32,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
          textAlign: Get.width > 768 ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Flutter Developer ',
          style: TextStyle(
            color: const Color(0xFFd1d5db),
            fontSize: Get.width > 768 ? 20 : 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: Get.width > 768 ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          'Hi, I\'m Rafay, A passionate Flutter developer dedicated to crafting innovative, high-quality mobile applications. With extensive experience in building and deploying scalable, user-centric apps, I specialize in integrating powerful backends like Firebase to bring ideas to life.',
          style: TextStyle(
            color: const Color(0xFF9cabba),
            fontSize: Get.width > 768 ? 18 : 16,
            height: 1.6,
          ),
          textAlign: Get.width > 768 ? TextAlign.left : TextAlign.center,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: Get.width > 768
              ? WrapAlignment.start
              : WrapAlignment.center,
          children: [
            _buildButton(
              'View Projects',
              Icons.visibility,
              const Color(0xFF0c7ff2),
              () => controller.scrollToSection('projects'),
            ),
            _buildButton(
              'Contact Me',
              Icons.mail,
              const Color(0xFF283039),
              () => controller.scrollToSection('contact'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
      ),
    );
  }
}
