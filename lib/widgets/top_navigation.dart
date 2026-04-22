import 'dart:ui';

import 'package:delight_studio/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TopNavigation extends StatelessWidget {
  final bool isDesktop;
  final bool isMenuOpen;
  final double width;
  final VoidCallback onMenuToggle;
  final Function(String) onNavTap;

  const TopNavigation({
    super.key,
    required this.isDesktop,
    required this.isMenuOpen,
    required this.onMenuToggle,
    required this.onNavTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60 : (width < 350 ? 12 : 20),
              vertical: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              border: const Border(
                bottom: BorderSide(color: Colors.white12, width: 0.5),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(30),
                  Colors.black.withAlpha(10),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: _Logo()),
                if (isDesktop)
                  _DesktopMenu(onNavTap: onNavTap)
                else
                  _MobileMenuIcon(onToggle: onMenuToggle, isOpen: isMenuOpen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isVerySmall = width < 350;

    return Text(
          'DELIGHT STUDIO',
          style: GoogleFonts.playfairDisplay(
            fontSize: isVerySmall ? 18 : 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.fontWhite,
            letterSpacing: isVerySmall ? 2 : 4,
          ),
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 3.seconds, color: AppTheme.backgroundBlack);
  }
}

class _DesktopMenu extends StatelessWidget {
  final Function(String) onNavTap;

  const _DesktopMenu({required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _MenuItem(title: 'HOME', onTap: () => onNavTap('home')),
        SizedBox(width: 20),
        _MenuItem(title: 'ABOUT', onTap: () => onNavTap('about')),
        SizedBox(width: 20),
        _CTAButton(onTap: () => onNavTap('contact'))
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(
              duration: 6.seconds,
              colors: [Colors.black54, Colors.white60, Colors.black54],
            ),
        SizedBox(width: 20),
        _MenuItem(title: 'GALLERY', onTap: () => onNavTap('gallery')),
        SizedBox(width: 20),
        _MenuItem(title: 'SERVICES', onTap: () => onNavTap('packages')),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppTheme.fontGrey, width: 1),
        ),
        backgroundColor: AppTheme.primarySilver.withAlpha(5),
        disabledBackgroundColor: AppTheme.fontGrey,
        foregroundColor: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.fontWhite,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CTAButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white30.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withAlpha(30), width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Text(
                  'CONTACT US',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.fontWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuIcon extends StatelessWidget {
  final VoidCallback onToggle;
  final bool isOpen;

  const _MobileMenuIcon({required this.onToggle, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return isOpen
        ? SizedBox.shrink()
        : IconButton(
            icon: Icon(Icons.menu, color: AppTheme.fontWhite, size: 30),
            onPressed: onToggle,
          );
  }
}
