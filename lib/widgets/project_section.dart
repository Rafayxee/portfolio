import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/portfolio_controller.dart';
import '../utils/animation_utils.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'MobileMate',
      'description':
          'Whether you are hunting for the latest smartphone, need to diagnose your device, or want to buy and sell phones. MobileMate makes it seamless and simple.',
      'screenshots': [
        'assets/images/mobmate ss/screen 1.png',
        'assets/images/mobmate ss/screen 2.png',
        'assets/images/mobmate ss/screen 3.png',
        'assets/images/mobmate ss/screen 4.png',
        'assets/images/mobmate ss/screen 5.png',
        'assets/images/mobmate ss/screen 6.png',
      ],
      'playStoreUrl':
          'https://play.google.com/store/apps/details?id=com.magma3c.mobilemate',
      'appStoreUrl': null,
    },
    {
      'title': 'Intentful',
      'description':
          'A beautifully designed app that helps users stay focused and productive by setting intentional goals and tracking progress with smart reminders.',
      'screenshots': [
        'assets/images/intently/intently-3.png',
        'assets/images/intently/intently-2.png',
        'assets/images/intently/intently-1.png',
      ],
      'playStoreUrl': null,
      'appStoreUrl': null,
    },
    {
      'title': 'Axon Player',
      'description':
          'A feature-rich IPTV player application that lets users stream live TV channels, movies, and series with a modern and intuitive interface.',
      'screenshots': [
        'assets/images/IPTV/1.png',
        'assets/images/IPTV/2.png',
        'assets/images/IPTV/3.png',
      ],
      'playStoreUrl': null,
      'appStoreUrl': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        _buildSectionHeader(context),
        const SizedBox(height: 60),
        // Projects list — images always left, text always right
        ...List.generate(projects.length, (index) {
          final project = projects[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < projects.length - 1 ? 120 : 0,
            ),
            child: _ScrollTriggeredFade(
              child: _buildProjectRow(context, project),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    return FadeSlideAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY WORK',
            style: TextStyle(
              color: Color(0xFF0c7ff2),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 16),
          Text(
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
          const SizedBox(height: 16),
          Container(
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
        ],
      ),
    );
  }

  Widget _buildProjectRow(BuildContext context, Map<String, dynamic> project) {
    final isMobile = ResponsiveUtils.isMobile(context);

    if (isMobile) {
      // Mobile: stacked vertically
      return Column(
        children: [
          _ProjectScreenshotCarousel(
            screenshots: List<String>.from(project['screenshots']),
          ),
          const SizedBox(height: 32),
          _buildInfoSide(context, project),
        ],
      );
    }

    // Desktop/Tablet: images LEFT, text RIGHT
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _ProjectScreenshotCarousel(
            screenshots: List<String>.from(project['screenshots']),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(flex: 5, child: _buildInfoSide(context, project)),
      ],
    );
  }

  Widget _buildInfoSide(BuildContext context, Map<String, dynamic> project) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final playStoreUrl = project['playStoreUrl'] as String?;
    final appStoreUrl = project['appStoreUrl'] as String?;

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title
        Text(
          (project['title'] as String).toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: ResponsiveUtils.getResponsiveFontSize(
              context,
              mobile: 28,
              tablet: 34,
              desktop: 40,
            ),
            fontWeight: FontWeight.w900,
            height: 1.1,
            letterSpacing: 1,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 20),
        // Description
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            project['description'] as String,
            style: TextStyle(
              color: const Color(0xFF9cabba),
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                mobile: 14,
                tablet: 15,
                desktop: 16,
              ),
              height: 1.7,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 32),
        // Store buttons — outlined style
        if (playStoreUrl != null || appStoreUrl != null)
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              if (playStoreUrl != null)
                _StoreButton(
                  icon: FontAwesomeIcons.googlePlay,
                  label: 'Play Store',
                  url: playStoreUrl,
                ),
              if (appStoreUrl != null)
                _StoreButton(
                  icon: FontAwesomeIcons.apple,
                  label: 'App Store',
                  url: appStoreUrl,
                ),
            ],
          ),
      ],
    );
  }
}

// ─── Auto-Scrolling Screenshot Carousel ──────────────────────────────────────

class _ProjectScreenshotCarousel extends StatefulWidget {
  final List<String> screenshots;

  const _ProjectScreenshotCarousel({required this.screenshots});

  @override
  State<_ProjectScreenshotCarousel> createState() =>
      _ProjectScreenshotCarouselState();
}

class _ProjectScreenshotCarouselState
    extends State<_ProjectScreenshotCarousel> {
  late PageController _pageController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_isHovering && mounted && _pageController.hasClients) {
        _currentPage = (_currentPage + 1) % widget.screenshots.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _goToPrevious() {
    if (_pageController.hasClients) {
      _currentPage =
          (_currentPage - 1 + widget.screenshots.length) %
          widget.screenshots.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _goToNext() {
    if (_pageController.hasClients) {
      _currentPage = (_currentPage + 1) % widget.screenshots.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screenshots.isEmpty) return const SizedBox.shrink();

    return MouseRegion(
      onEnter: (_) => _isHovering = true,
      onExit: (_) => _isHovering = false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 520,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.screenshots.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = (_pageController.page ?? 0) - index;
                      value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                    }
                    return Center(
                      child: AnimatedScale(
                        scale: value,
                        duration: const Duration(milliseconds: 200),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: const Color(
                            0xFF0c7ff2,
                          ).withValues(alpha: 0.06),
                          blurRadius: 30,
                          spreadRadius: -5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.screenshots[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF1b2127),
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Color(0xFF9cabba),
                                size: 48,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Prev / Next buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CarouselNavButton(
                icon: Icons.arrow_back_rounded,
                onTap: _goToPrevious,
              ),
              const SizedBox(width: 12),
              // Page counter
              Text(
                '${_currentPage + 1} / ${widget.screenshots.length}',
                style: const TextStyle(
                  color: Color(0xFF9cabba),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 12),
              _CarouselNavButton(
                icon: Icons.arrow_forward_rounded,
                onTap: _goToNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Carousel Navigation Button ──────────────────────────────────────────────

class _CarouselNavButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CarouselNavButton({required this.icon, required this.onTap});

  @override
  State<_CarouselNavButton> createState() => _CarouselNavButtonState();
}

class _CarouselNavButtonState extends State<_CarouselNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered
                ? const Color(0xFF0c7ff2).withValues(alpha: 0.15)
                : Colors.transparent,
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF0c7ff2)
                  : const Color(0xFF283039),
              width: 1.5,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered
                ? const Color(0xFF0c7ff2)
                : const Color(0xFF9cabba),
            size: 20,
          ),
        ),
      ),
    );
  }
}

// ─── Store Button — Outlined Style ───────────────────────────────────────────

class _StoreButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(Uri.parse(widget.url));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? const Color(0xFF0c7ff2).withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF0c7ff2)
                  : const Color(0xFF283039),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                color: _isHovered
                    ? const Color(0xFF0c7ff2)
                    : const Color(0xFF9cabba),
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: _isHovered
                      ? const Color(0xFF0c7ff2)
                      : const Color(0xFF9cabba),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Scroll Triggered Fade Animation ─────────────────────────────────────────

class _ScrollTriggeredFade extends StatefulWidget {
  final Widget child;

  const _ScrollTriggeredFade({required this.child});

  @override
  State<_ScrollTriggeredFade> createState() => _ScrollTriggeredFadeState();
}

class _ScrollTriggeredFadeState extends State<_ScrollTriggeredFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 60),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    if (_hasAnimated || !mounted) return;

    final scrollController = Get.find<PortfolioController>().scrollController;
    scrollController.addListener(_onScroll);
    _onScroll();
  }

  void _onScroll() {
    if (_hasAnimated || !mounted) return;

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    if (position.dy < screenHeight * 0.85) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: _slideAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
