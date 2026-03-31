import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : width * 0.1,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_outline,
                color: Color(0xFFC0C0C0),
                size: 16,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Why Choose Delight Studio',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontSize: isMobile ? 24 : null,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.star_outline,
                color: Color(0xFFC0C0C0),
                size: 16,
              ),
            ],
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 60),
          _buildResponsiveFeatures(context, isMobile, width),
        ],
      ),
    );
  }

  Widget _buildResponsiveFeatures(
    BuildContext context,
    bool isMobile,
    double width,
  ) {
    if (isMobile) {
      return Column(
        children: [
          _buildTextContent(context),
          const SizedBox(height: 40),
          _buildGrid(context, 1),
        ],
      );
    }
    return Column(
      children: [
        _buildTextContent(context),
        const SizedBox(height: 70),
        _buildGrid(context, 2),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
          children: [
            Text(
              'Your Story, Our Lens',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "At Delight Studio, we believe every brand has a story that "
              "deserves to be told with both authenticity and strategic "
              "impact. From human-interest documentaries to high-conversion "
              "social media campaigns, our team is dedicated to "
              "transforming your mission into professional visual assets. "
              "We merge cinematic storytelling with modern digital trends "
              "to create content that doesn't just capture moments, but "
              "drives engagement and resonates deeply with your audience.",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 200.ms, duration: 600.ms)
        .slideX(begin: -0.1, end: 0);
  }

  Widget _buildGrid(BuildContext context, int columns) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: columns,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.5,
      children: [
        _FeatureCard(
          icon: Icons.camera_alt_outlined,
          title: 'Capturing Emotions, Not Just Poses',
          imagePath: 'assets/emotion.png',
          desc:
              'We strive to tell your story through candid shots and genuine moments of joy.',
        ),
        _FeatureCard(
          icon: Icons.verified_outlined,
          title: 'Experience Our Professional Services',
          imagePath: 'assets/lens.jpg',
          desc:
              'With years of experience, we provide seamless and professional services on your big day.',
        ),
      ],
    ).animate().fadeIn(delay: 400.ms, duration: 800.ms).slideY(begin: 0.1, end: 0);
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final String imagePath;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withAlpha(30),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white30, width: 1),
            gradient: LinearGradient(
              colors: [Colors.white.withAlpha(30), Colors.grey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                // Background Watermark Icon
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                // Main Content
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: const Color(0xFFC0C0C0), size: 40),
                      const SizedBox(height: 15),
                      Flexible(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          desc,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
