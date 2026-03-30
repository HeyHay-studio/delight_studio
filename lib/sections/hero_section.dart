import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF121212),
        image: DecorationImage(
          image: AssetImage('assets/hero.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          _buildContent(context, isMobile, width),
          _buildSocialSidebar(isMobile),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile, double width) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Delight Studio\nWhere Moments Become Memories',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isMobile ? 36 : 64,
                color: Colors.white,
              ),
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
            const SizedBox(height: 20),
            SizedBox(
              width: 800,
              child: Text(
                'Indulge in the magic of your forgotten wedding, photographic '
                'moments capturing long-standing love story. Our seasoned '
                'photographers work to capture every shimmer of emotion, '
                'ensuring every moment is cherished forever. Let us tell '
                'the essence of your special day – tailored exclusively '
                'for you.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
            ),
            const SizedBox(height: 40),
            _BookDayButton()
                .animate()
                .fadeIn(delay: 800.ms)
                .scale(begin: const Offset(0.8, 0.8)),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialSidebar(bool isMobile) {
    if (isMobile) {
      return Positioned(
        left: 0,
        right: 0,
        bottom: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 30, height: 1.5, color: Colors.white24),
            _socialIcon(FontAwesomeIcons.facebook),
            _socialIcon(FontAwesomeIcons.instagram),
            _socialIcon(FontAwesomeIcons.xTwitter),
            _socialIcon(FontAwesomeIcons.tiktok),
            Container(width: 30, height: 1.5, color: Colors.white24),
          ],
        ),
      );
    }
    //return const SizedBox.shrink();
    return Positioned(
      left: 40,
      bottom: 100,
      child: Column(
        children: [
          Container(width: 1.5, height: 140, color: Colors.white24),
          const SizedBox(height: 20),
          _socialIcon(FontAwesomeIcons.facebook),
          const SizedBox(height: 15),
          _socialIcon(FontAwesomeIcons.instagram),
          const SizedBox(height: 15),
          _socialIcon(FontAwesomeIcons.xTwitter),
          const SizedBox(height: 15),
          _socialIcon(FontAwesomeIcons.tiktok),
        ],
      ),
    );
  }

  Widget _socialIcon(dynamic icon, {VoidCallback? onTap}) {
    double size = 16;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child:
            AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size * 2,
                  height: size * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white12),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: FaIcon(icon, color: Colors.white, size: size - 2),
                  ),
                )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .rotate(
                  begin: -0.1,
                  end: 0.1,
                  duration: 3.seconds,
                  curve: Curves.easeInOut,
                ),
      ),
    );
  }
}

class _BookDayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            border: Border.all(color: Colors.white24, width: 1.5),
            borderRadius: BorderRadius.circular(0),
          ),
          child:
              Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'BOOK NOW',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 12.seconds, color: Colors.black),
        ),
      ),
    );
  }
}
