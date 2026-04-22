import 'package:delight_studio/core/constants.dart';
import 'package:delight_studio/sections/special_package.dart';
import 'package:delight_studio/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/package_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 30 : width * 0.1,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        image: DecorationImage(
          image: AssetImage('assets/services.jpg'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Our Services',
            style: Theme.of(context).textTheme.displaySmall,
          ).animate().fadeIn(),
          const SizedBox(height: 80),
          _buildCategorySection(
            context,
            "Commercial/Advertising Videos",
            AppConstants.commercialServices,
            isMobile,
          ),
          const SizedBox(height: 100),
          _buildCategorySection(
            context,
            "Social Media Content Creation",
            AppConstants.socialServices,
            isMobile,
          ),
          const SizedBox(height: 100),
          _buildCategorySection(
            context,
            "Documentary Videography",
            AppConstants.documentationServices,
            isMobile,
          ),
          const SizedBox(height: 100),
          _buildCategorySection(
            context,
            "Corporate/Business Videography",
            AppConstants.corporateServices,
            isMobile,
          ),
          const SizedBox(height: 100),
          TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoDialogRoute(
                      context: context,
                      builder: (context) => SpecialPackage(isMobile: isMobile),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha(5),
                  foregroundColor: AppTheme.fontWhite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: const Color(0xFFD4AF37).withAlpha(100),
                      width: 1,
                    ),
                  ),
                ),
                icon: Icon(
                  CupertinoIcons.photo_camera,
                  size: 18,
                  color: AppTheme.primarySilver,
                ),
                // Changed to star for 'Special'
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'OUR SPECIAL PACKAGE',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 14, // Adjusting scale for button context
                        color: AppTheme.fontGrey,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.5,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                    const SizedBox(width: 8),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 14,
                      color: Color(0xFFD4AF37),
                    ),
                  ],
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(
                duration: 2.seconds,
                color: AppTheme.primarySilver.withAlpha(40),
              ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> services,
    bool isMobile,
  ) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 50),
        _buildResponsiveGrid(context, services, isMobile),
      ],
    );
  }

  Widget _buildResponsiveGrid(
    BuildContext context,
    List<Map<String, dynamic>> services,
    bool isMobile,
  ) {
    if (isMobile) {
      return Column(
        children: services.asMap().entries.expand((entry) {
          final index = entry.key;
          final service = entry.value;
          return [
            PackageCard(
              title: service['title'],
              description: service['description'],
              delay: service['delay'],
            ),
            if (index < services.length - 1) const SizedBox(height: 30),
          ];
        }).toList(),
      );
    }

    return Wrap(
      spacing: 30,
      runSpacing: 40,
      alignment: WrapAlignment.center,
      children: services.map((service) {
        return SizedBox(
          width: 350,
          child: PackageCard(
            title: service['title'],
            description: service['description'],
            delay: service['delay'],
          ),
        );
      }).toList(),
    );
  }
}
