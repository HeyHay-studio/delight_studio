import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delight_studio/theme/app_theme.dart';

class MobileMenu extends StatelessWidget {
  final bool isMenuOpen;
  final VoidCallback onClose;
  final Function(String) onNavTap;

  const MobileMenu({
    super.key,
    required this.isMenuOpen,
    required this.onClose,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    if (!isMenuOpen) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.95),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 35),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 60),
          _MobileNavLine(title: 'HOME', onTap: () { onNavTap('home'); onClose(); }),
          _MobileNavLine(title: 'ABOUT', onTap: () { onNavTap('about'); onClose(); }),
          _MobileNavLine(title: 'GALLERY', onTap: () { onNavTap('gallery'); onClose(); }),
          _MobileNavLine(title: 'PACKAGES', onTap: () { onNavTap('packages'); onClose(); }),
          _MobileNavLine(title: 'CONTACT', onTap: () { onNavTap('contact'); onClose(); }),
          const Spacer(),
          _CTAButtonMobile(),
        ],
      ),
    );
  }
}

class _MobileNavLine extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileNavLine({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

class _CTAButtonMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primarySilver,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          'GET IN TOUCH',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
