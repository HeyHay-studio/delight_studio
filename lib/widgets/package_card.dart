import 'package:delight_studio/widgets/package_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class PackageCard extends StatefulWidget {
  final String title;
  final String description;
  final int delay;

  const PackageCard({
    super.key,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                transform: Matrix4.diagonal3Values(
                  _isHovered ? 1.05 : 1.03,
                  _isHovered ? 1.05 : 1.03,
                  1.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppTheme.surfaceCard,
                  border: Border.all(color: AppTheme.backgroundBlack, width: 4),
                  boxShadow: [
                    _isHovered
                        ? BoxShadow(
                            color: AppTheme.primarySilver.withAlpha(18),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        : BoxShadow(),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: AppTheme.fontGrey,
                      ),
                    ),
                    const SizedBox(height: 60),
                    PackageButton(onTap: () {}),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: widget.delay.ms, duration: 800.ms)
              .slideY(begin: 0.1, end: 0),
    );
  }
}
