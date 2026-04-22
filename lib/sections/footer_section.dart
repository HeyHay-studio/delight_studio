import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: isMobile ? 20 : width * 0.1,
      ),
      color: Colors.black,
      child: Column(
        children: [
          _buildResponsiveRows(isMobile),
          const SizedBox(height: 60),
          const Divider(color: Colors.white12),
          const SizedBox(height: 30),
          _buildBottomBar(isMobile),
        ],
      ),
    );
  }

  Widget _buildResponsiveRows(bool isMobile) {
    if (isMobile) {
      return _buildBrandCol(isMobile);
    }
    return _buildBrandCol(isMobile);
  }

  Widget _buildBrandCol(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'DELIGHT STUDIO',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Stay connected with Delight Studio Photography for exclusive '
          'behind-the-scenes, wedding inspiration, and expert tips to '
          'capture your special day perfectly.',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.white54,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SocialIcon(icon: FontAwesomeIcons.facebook, onTap: () {}),
            _SocialIcon(icon: FontAwesomeIcons.instagram, onTap: () {}),
            _SocialIcon(icon: FontAwesomeIcons.xTwitter, onTap: () {}),
            _SocialIcon(icon: FontAwesomeIcons.tiktok, onTap: () {}),
            _SocialIcon(icon: FontAwesomeIcons.envelope, onTap: () {}),
            SizedBox(),
            if (!isMobile) SizedBox(width: 40),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailInput() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            border: Border.all(color: Colors.white12, width: 1),
          ),
          child: TextField(
            style: const TextStyle(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              hintText: 'Please enter your email',
              hintStyle: GoogleFonts.montserrat(
                color: Colors.white24,
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool wrapLayout = constraints.maxWidth < 450;
        return Column(
          children: [
            if (wrapLayout) ...[
              Text(
                '© 2026 DELIGHT STUDIO.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white24,
                  fontSize: 11,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'ALL RIGHTS RESERVED.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.white24,
                  fontSize: 11,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'Developed By:',
                    style: GoogleFonts.bellefair(
                      color: Colors.white30,
                      fontSize: 8,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'HeyHay Studio',
                    style: GoogleFonts.bellefair(
                      color: Colors.white54,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    '®',
                    style: GoogleFonts.bellefair(
                      color: Colors.white30,
                      fontSize: 6,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ] else
              Text(
                '© 2026 DELIGHT STUDIO. ALL RIGHTS RESERVED.',
                style: GoogleFonts.montserrat(
                  color: Colors.white24,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            if (wrapLayout) const SizedBox(height: 25),
            if (!isMobile) ...[
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'Developed By:',
                    style: GoogleFonts.bellefair(
                      color: Colors.white30,
                      fontSize: 10,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'HeyHay Studio',
                    style: GoogleFonts.bellefair(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    '®',
                    style: GoogleFonts.bellefair(
                      color: Colors.white30,
                      fontSize: 9,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final dynamic icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: FaIcon(icon, color: Colors.white54, size: 16),
        ),
      ),
    );
  }
}

class _SubscribeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            'Subscribe',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
