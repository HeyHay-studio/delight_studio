import 'package:delight_studio/sections/about_section.dart';
import 'package:delight_studio/sections/contact_section.dart';
import 'package:delight_studio/sections/features_section.dart';
import 'package:delight_studio/sections/footer_section.dart';
import 'package:delight_studio/sections/gallery_section.dart';
import 'package:delight_studio/sections/hero_section.dart';
import 'package:delight_studio/sections/services_section.dart';
import 'package:delight_studio/theme/app_theme.dart';
import 'package:delight_studio/widgets/mobile_menu.dart';
import 'package:delight_studio/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DelightApp());
}

class DelightApp extends StatelessWidget {
  const DelightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delight Studio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;
  final ScrollController scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey galleryKey = GlobalKey();
  final GlobalKey packagesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section.toLowerCase()) {
      case 'home':
        targetKey = heroKey;
        break;
      case 'services':
      case 'features':
        targetKey = servicesKey;
        break;
      case 'about':
        targetKey = aboutKey;
        break;
      case 'gallery':
        targetKey = galleryKey;
        break;
      case 'packages':
        targetKey = packagesKey;
        break;
      case 'contact':
        targetKey = contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      backgroundColor: AppTheme.backgroundBlack,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                HeroSection(key: heroKey),
                FeaturesSection(key: servicesKey),
                AboutSection(key: aboutKey),
                GallerySection(key: galleryKey),
                ServicesSection(key: packagesKey),
                ContactSection(key: contactKey),
                const FooterSection(),
              ],
            ),
          ),
          TopNavigation(
            isDesktop: isDesktop,
            isMenuOpen: isMenuOpen,
            width: screenWidth,
            onMenuToggle: toggleMenu,
            onNavTap: scrollToSection,
          ),
          if (!isDesktop)
            MobileMenu(
              isMenuOpen: isMenuOpen,
              onClose: toggleMenu,
              onNavTap: scrollToSection,
            ),
        ],
      ),
    );
  }
}
