import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 30 : width * 0.1),
      child: Column(
        children: [
          Text(
            'Our Packages',
            style: Theme.of(context).textTheme.displaySmall,
          ).animate().fadeIn(),
          const SizedBox(height: 60),
          _buildResponsivePackages(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildResponsivePackages(BuildContext context, bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          const _PackageCard(
            title: 'SILVER PACKAGE',
            price: '\$1,500',
            features: [
              '6 Hours Photography',
              'Single Photographer',
              'Online Gallery',
              'Social Media Preview',
            ],
            delay: 0,
          ),
          const SizedBox(height: 30),
          const _PackageCard(
            title: 'PLATINUM PACKAGE',
            price: '\$2,800',
            isPremium: true,
            features: [
              '10 Hours Photography',
              'Two Photographers',
              'Premium Photo Album',
              'Full Digital Rights',
            ],
            delay: 200,
          ),
          const SizedBox(height: 30),
          const _PackageCard(
            title: 'LUXE PACKAGE',
            price: '\$4,500',
            features: [
              'Full Day Photography',
              'Cinematic Highlight Video',
              'Engagements Shoot included',
              'Luxe Velvet Album',
            ],
            delay: 400,
          ),
        ],
      );
    }
    return Row(
      children: [
        const Expanded(
          child: _PackageCard(
            title: 'SILVER PACKAGE',
            price: '\$1,500',
            features: [
              '6 Hours Photography',
              'Single Photographer',
              'Online Gallery',
              'Social Media Preview',
            ],
            delay: 0,
          ),
        ),
        const SizedBox(width: 30),
        const Expanded(
          child: _PackageCard(
            title: 'PLATINUM PACKAGE',
            price: '\$2,800',
            isPremium: true,
            features: [
              '10 Hours Photography',
              'Two Photographers',
              'Premium Photo Album',
              'Full Digital Rights',
            ],
            delay: 200,
          ),
        ),
        const SizedBox(width: 30),
        const Expanded(
          child: _PackageCard(
            title: 'LUXE PACKAGE',
            price: '\$4,500',
            features: [
              'Full Day Photography',
              'Cinematic Highlight Video',
              'Engagements Shoot included',
              'Luxe Velvet Album',
            ],
            delay: 400,
          ),
        ),
      ],
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final bool isPremium;
  final int delay;

  const _PackageCard({
    required this.title,
    required this.price,
    required this.features,
    this.isPremium = false,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      decoration: BoxDecoration(
        color: isPremium ? const Color(0xFF1E1E1E) : Colors.black,
        border: Border.all(
          color: isPremium ? const Color(0xFFC0C0C0) : Colors.white12,
          width: isPremium ? 2 : 1,
        ),
        boxShadow: isPremium
            ? [
                BoxShadow(
                  color: const Color(0xFFC0C0C0).withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: isPremium ? const Color(0xFFC0C0C0) : Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            price,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 40),
          Container(width: 40, height: 1, color: Colors.white24),
          const SizedBox(height: 40),
          Column(
            children: features
                .map((f) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        f,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 60),
          _PackageButton(isPremium: isPremium),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms, duration: 800.ms).slideY(begin: 0.1, end: 0);
  }
}

class _PackageButton extends StatelessWidget {
  final bool isPremium;

  const _PackageButton({required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: isPremium ? const Color(0xFFC0C0C0) : Colors.transparent,
        border: Border.all(color: const Color(0xFFC0C0C0), width: 1.5),
      ),
      child: Center(
        child: Text(
          'SELECT PLAN',
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isPremium ? Colors.black : const Color(0xFFC0C0C0),
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
