import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 30 : width * 0.15,
      ),
      color: Colors.black45.withAlpha(80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.auto_awesome,
                color: Color(0xFFC0C0C0),
                size: 20,
              ),
              const SizedBox(width: 15),
              Text('About Us', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(width: 15),
              const Icon(
                Icons.auto_awesome,
                color: Color(0xFFC0C0C0),
                size: 20,
              ),
            ],
          ).animate().fadeIn(),
          const SizedBox(height: 60),
          _buildResponsiveContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildResponsiveContent(BuildContext context, bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildImage(),
          const SizedBox(height: 40),
          _buildText(context),
        ],
      );
    }
    return Row(
      children: [
        Expanded(child: _buildImage()),
        const SizedBox(width: 60),
        Expanded(child: _buildText(context)),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/delight.png"),
          fit: BoxFit.cover,
        ),
        color: const Color(0xFF1E1E1E),
        border: Border.all(color: Colors.white12, width: 1),
      ),
    ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Our Story', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 25),
        Text(
          'Founded by a group of passionate visual storytellers, Delight Studio began with a simple mission: to capture the raw, unscripted beauty of love. We believe that every wedding has its own unique rhythm, and our job is to find those quiet, profound moments that often go unnoticed.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          'Over the last decade, we have traveled across the globe, documenting unions of all cultures and traditions. Our style is a blend of editorial elegance and cinematic realism, ensuring your photos look as breathtaking as they felt.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ).animate().fadeIn(delay: 300.ms, duration: 800.ms).slideX(begin: 0.1, end: 0);
  }
}
