import 'package:delight_studio/core/constants.dart';
import 'package:delight_studio/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
          image: AssetImage('assets/services.png'),
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
            _PackageCard(
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
          child: _PackageCard(
            title: service['title'],
            description: service['description'],
            delay: service['delay'],
          ),
        );
      }).toList(),
    );
  }
}

class _PackageCard extends StatefulWidget {
  final String title;
  final String description;
  final int delay;

  const _PackageCard({
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<_PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<_PackageCard> {
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
                            color: Colors.yellow.withAlpha(18),
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
                    _PackageButton(onTap: () {}),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: widget.delay.ms, duration: 800.ms)
              .slideY(begin: 0.1, end: 0),
    );
  }
}

class _PackageButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _PackageButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withAlpha(100), width: 2),
            ),
            child:
                Text(
                      'SELECT PACKAGE',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC0C0C0),
                        letterSpacing: 1.2,
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                      curve: Curves.easeInToLinear,
                      duration: 12.seconds,
                      colors: [
                        Colors.yellow.withAlpha(60),
                        Colors.black,
                        Colors.yellow.withAlpha(60),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
