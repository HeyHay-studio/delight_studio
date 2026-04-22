import 'dart:ui';

import 'package:delight_studio/widgets/package_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';

class SpecialPackage extends StatelessWidget {
  final bool isMobile;

  const SpecialPackage({required this.isMobile, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                CupertinoIcons.chevron_back,
                size: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.backgroundBlack,
              ),
            ),
            Flexible(
              child: Text(
                'DELIGHT   WEDDINGS',
                style: GoogleFonts.tangerine(
                  color: AppTheme.backgroundBlack,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                children: [
                  // Section Subtitle
                  Text(
                    "ARTISTRY IN MOTION",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                      color: AppTheme.primarySilver,
                    ),
                  ).animate().fadeIn(duration: 800.ms),

                  const SizedBox(height: 20),

                  // The Main Statement
                  Text(
                        "Beyond the frame, we capture the soul of your celebration. Our Signature Wedding Collections are meticulously crafted to preserve the raw emotion, the quiet glances, and the grand traditions of your story.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.tenorSans(
                          fontSize: 20,
                          height: 1.6,
                          color: Colors.black,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 1.seconds)
                      .slideY(begin: 0.1, end: 0),

                  const SizedBox(height: 25),

                  // Call to Action / Final sentence
                  Text(
                    "Experience a cinematic journey tailored for the modern couple, where every moment is treated as a masterpiece.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      height: 1.8,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ).animate().fadeIn(delay: 600.ms),

                  const SizedBox(height: 30),

                  // Decorative Divider
                  Container(
                    width: 40,
                    height: 1,
                    color: Colors.black26,
                  ).animate().scaleX(delay: 900.ms, duration: 600.ms),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Text(
              'Tailored for One-Day Traditional or White Wedding',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 20),

            SizedBox(
              height: 620,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/20251214-DSG01393.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 2. The Blur (Middle layer - blurs the image)
                  Positioned.fill(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: Container(
                          color: AppTheme.surfaceCard.withValues(alpha: 0.1),
                        ), // Tint
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 560,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            _buildPackageCard("1.", "ESSENCE", [
                              "Up to 6 Hours Coverage",
                              "1-Minute Highlight Trailer",
                              "45-Minute Full Film",
                              "Professional Cinematic Coverage",
                              "Delivery: Google Drive Link",
                            ]),
                            _buildPackageCard("2.", "ETERNAL", [
                              "Up to 8 Hours Coverage",
                              "2-3 Minute Highlight Trailer",
                              "60-Minute Full Film",
                              "Professional Cinematic Coverage",
                              "Delivery: Google Drive Link + Forever Box USB",
                            ]),
                            _buildPackageCard("3.", "MAJESTIC", [
                              "Full-Day Coverage (10-12 Hours)",
                              "5-Minute Extended Highlight Film",
                              "75-90 Minute Full Cinematic Film",
                              "Drone & Second Shooter Included",
                              "Delivery: Google Drive + Premium Forever Box",
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            Text(
              'Tailored for Two-Days Traditional or White Wedding',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(delay: 400.ms),

            const SizedBox(height: 20),

            SizedBox(
              height: 620,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/20251214-DSG01569.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 2. The Blur (Middle layer - blurs the image)
                  Positioned.fill(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                        child: Container(
                          color: AppTheme.surfaceCard.withValues(alpha: 0.1),
                        ), // Tint
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 560,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            _buildPackageCard("1.", "UNION", [
                              "Up to 6 Hours Coverage Each Day",
                              "2 Highlight Trailer (1-Minute Each, Per Day)",
                              "75-Minute Combined Full Film (Covering Both Ceremonies)",
                              "Professional Cinematic Coverage",
                              "Delivery: Google Drive Link",
                            ]),
                            _buildPackageCard("2.", "HERITAGE", [
                              "Up to 8 Hours Coverage Each Day",
                              "2 Cinematic Trailers (2-3 Minute Each)",
                              "90-Minute Combined Full Film (Blending Traditional + White Wedding)",
                              "Drone Coverage Included (Each Day)",
                              "Delivery: Google Drive Link + Forever Box USB",
                            ]),
                            _buildPackageCard("3.", "LEGACY", [
                              "Full-Day Coverage (10-12 Hours Each Day)",
                              "Extended Highlight Film (7-10 Minutes, Covering Both Days)",
                              "90+ Minute Full Cinematic Film (Traditional + White Wedding Combined",
                              "Drone Coverage + Second Shooter Included (Both Days)",
                              "Delivery: Google Drive + Premium Forever Box",
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // Cinematic Image Break
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.asset(
                  'assets/20251214-DSG01452.jpg',
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ).animate().fadeIn(delay: 600.ms),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(String num, String name, List<String> perks) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.backgroundBlack, width: 2),
        color: AppTheme.primarySilver.withAlpha(120),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          // Circular Number
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.backgroundBlack,
              shape: BoxShape.circle,
            ),
            child: Text(
              num,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: GoogleFonts.tenorSans(
              fontSize: 22,
              color: AppTheme.backgroundBlack,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 25),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: perks
                    .map(
                      (perk) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          "• $perk",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            height: 1.4,
                            color: AppTheme.backgroundBlack,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(color: Colors.black87, blurRadius: 1),
                              Shadow(
                                color: Colors.white54,
                                offset: Offset(-1, -1),
                                blurRadius: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          PackageButton(
            background: AppTheme.backgroundBlack,
          ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
