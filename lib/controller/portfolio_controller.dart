import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Reactive variables
  var isLoading = false.obs;
  var selectedSection = 'hero'.obs;

  // Section keys for navigation
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      _updateSelectedSection();
    });
  }

  void _updateSelectedSection() {
    final scrollOffset = scrollController.offset;

    if (_isKeyVisible(contactKey)) {
      selectedSection.value = 'contact';
    } else if (_isKeyVisible(experienceKey)) {
      selectedSection.value = 'experience';
    } else if (_isKeyVisible(skillsKey)) {
      selectedSection.value = 'skills';
    } else if (_isKeyVisible(projectsKey)) {
      selectedSection.value = 'projects';
    } else {
      selectedSection.value = 'hero';
    }
  }

  bool _isKeyVisible(GlobalKey key) {
    if (key.currentContext == null) return false;

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = Get.height;

    return position.dy < screenHeight * 0.5 &&
        position.dy > -renderBox.size.height * 0.5;
  }

  void scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'projects':
        targetKey = projectsKey;
        break;
      case 'skills':
        targetKey = skillsKey;
        break;
      case 'experience':
        targetKey = experienceKey;
        break;
      case 'contact':
        targetKey = contactKey;
        break;
      default:
        targetKey = heroKey;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void submitForm() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    // Simulate form submission
    await Future.delayed(const Duration(seconds: 2));

    Get.snackbar(
      'Success',
      'Message sent successfully!',
      backgroundColor: const Color(0xFF0c7ff2),
      colorText: Colors.white,
    );

    // Clear form
    nameController.clear();
    emailController.clear();
    messageController.clear();

    isLoading.value = false;
  }

  @override
  void onClose() {
    scrollController.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
