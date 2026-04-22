import 'dart:ui';

import 'package:delight_studio/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 20 : width * 0.15,
      ),
      color: AppTheme.backgroundBlack,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_outline,
                color: AppTheme.primarySilver,
                size: 20,
              ),
              const SizedBox(width: 15),
              Text(
                'Contact Us',
                style: GoogleFonts.playfairDisplay(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.star_outline,
                color: AppTheme.primarySilver,
                size: 20,
              ),
            ],
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 20),
          SizedBox(
            width: 800,
            child: Text(
              'Connect with Us - Your Concerns, Our Priority. Your wedding '
              'memories matter, and we\u2019re here to address every query '
              'and request promptly.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.white70,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
          const SizedBox(height: 60),
          _buildForm(context, isMobile),
          const SizedBox(height: 40),
          _SubmitButton()
              .animate()
              .fadeIn(delay: 600.ms)
              .scale(begin: const Offset(0.9, 0.9)),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, bool isMobile) {
    return Column(
      children: [
        _buildResponsiveRow(isMobile, [
          const _ContactField(
            label: 'Full Name',
            hint: 'Please enter your full name',
          ),
        ]),
        _buildResponsiveRow(isMobile, [
          const _ContactField(label: 'Email', hint: 'Please enter your email'),
          const _ContactField(
            label: 'Phone Number',
            hint: 'Please enter your number',
          ),
        ]),
        const _ContactField(
          label: 'Tell us about your Issues',
          hint: 'Please tell me more details about what you are requesting.',
          maxLines: 6,
        ),
      ],
    ).animate().fadeIn(delay: 400.ms, duration: 800.ms);
  }

  Widget _buildResponsiveRow(bool isMobile, List<Widget> children) {
    if (isMobile) {
      return Column(children: children);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 30),
        Expanded(child: children[0]),
      ],
    );
  }
}

class _ContactField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final bool isDate;
  final bool isDropdown;

  const _ContactField({
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.isDate = false,
    this.isDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(5),
                  border: Border.all(color: Colors.white12, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextField(
                  maxLines: maxLines,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.white24,
                      fontSize: 13,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    border: InputBorder.none,
                    suffixIcon: isDate
                        ? const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white24,
                            size: 18,
                          )
                        : isDropdown
                        ? const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white24,
                            size: 20,
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(10),
            border: Border.all(color: Colors.white24, width: 1),
          ),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                'SEND MESSAGE',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
