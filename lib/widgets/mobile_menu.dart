import 'dart:ui';

import 'package:delight_studio/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // We use AnimatedPresence-like logic with an AnimatedOpacity and BackdropFilter
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isMenuOpen
          ? Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        Icon(
                              CupertinoIcons.photo_camera,
                              size: 160,
                              color: AppTheme.fontGrey.withAlpha(60),
                            )
                            .animate()
                            .scale(
                              begin: const Offset(0.5, 0.5),
                              end: const Offset(1.5, 1.5),
                              duration: 300.ms,
                              curve: Curves.bounceInOut,
                            )
                            .then()
                            .animate(
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true),
                            )
                            .scale(
                              begin: const Offset(1.5, 1.5),
                              end: const Offset(1.3, 1.3),
                              duration: 3.seconds,
                              curve: Curves.easeInOutSine,
                            ),
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: Container(color: Colors.black.withValues(alpha: 0.55)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child:
                              IconButton(
                                onPressed: onClose,
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ).animate().rotate(
                                begin: -0.5,
                                end: 0,
                                duration: 400.ms,
                              ),
                        ),

                        const SizedBox(height: 40),

                        // Navigation Items with Stagger
                        ..._navItems(context),

                        const Spacer(),

                        // The Styled CTA we discussed
                        _CTAButtonMobile(onTap: () => onNavTap('contact')),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  List<Widget> _navItems(BuildContext context) {
    final items = [
      ('HOME', 'home'),
      ('ABOUT', 'about'),
      ('GALLERY', 'gallery'),
      ('PACKAGES', 'packages'),
      ('CONTACT', 'contact'),
    ];

    return items.asMap().entries.map((entry) {
      int index = entry.key;
      var (title, route) = entry.value;

      return _MobileNavLine(
        title: title,
        index: index,
        onTap: () {
          HapticFeedback.lightImpact();
          onNavTap(route);
          onClose();
        },
      );
    }).toList();
  }
}

class _MobileNavLine extends StatelessWidget {
  final String title;
  final int index;
  final VoidCallback onTap;

  const _MobileNavLine({
    required this.title,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child:
            Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                )
                .animate()
                .fadeIn(delay: (100 * index).ms, duration: 500.ms)
                .slideX(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
      ),
    );
  }
}

class _CTAButtonMobile extends StatelessWidget {
  final VoidCallback onTap;

  const _CTAButtonMobile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.fontGrey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.fontGrey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          'BOOK NOW',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            letterSpacing: 3,
            fontSize: 16,
          ),
        ),
      ),
    ).animate().fadeIn(delay: 600.ms).moveY(begin: 30, end: 0);
  }
}
