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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrandCol(),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildLinksPageCol()),
              Expanded(child: _buildLinksHelpCol()),
            ],
          ),
          const SizedBox(height: 40),
          _buildNewsletterCol(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildBrandCol()),
        const SizedBox(width: 40),
        Expanded(child: _buildLinksPageCol()),
        const SizedBox(width: 40),
        Expanded(child: _buildLinksHelpCol()),
        const SizedBox(width: 40),
        Expanded(flex: 2, child: _buildNewsletterCol()),
      ],
    );
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 25),
        Text(
          'Stay connected with Delight Studio Photography for exclusive behind-the-scenes, wedding inspiration, and expert tips to capture your special day perfectly.',
          style: GoogleFonts.montserrat(
            color: Colors.white54,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            _SocialIcon(icon: FontAwesomeIcons.facebook),
            _SocialIcon(icon: FontAwesomeIcons.instagram),
            _SocialIcon(icon: FontAwesomeIcons.xTwitter),
            _SocialIcon(icon: FontAwesomeIcons.tiktok),
          ],
        ),
      ],
    );
  }

  Widget _buildLinksPageCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _FooterLink(text: 'Pages', isTitle: true),
        _FooterLink(text: 'Home'),
        _FooterLink(text: 'About'),
        _FooterLink(text: 'Gallery'),
        _FooterLink(text: 'Packages'),
        _FooterLink(text: 'Features'),
        _FooterLink(text: 'Pricing'),
      ],
    );
  }

  Widget _buildLinksHelpCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _FooterLink(text: 'Help', isTitle: true),
        _FooterLink(text: 'Contact us'),
        _FooterLink(text: 'FAQs'),
        _FooterLink(text: 'Availability'),
        _FooterLink(text: 'Privacy Policy'),
        _FooterLink(text: 'Terms of Services'),
      ],
    );
  }

  Widget _buildNewsletterCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FooterLink(text: 'Subscribe To Our Newsletters', isTitle: true),
        const SizedBox(height: 10),
        Text(
          'Join our community and be the first to receive exclusive offers, photography tips, and heartwarming stories straight to your inbox.',
          style: GoogleFonts.montserrat(
            color: Colors.white54,
            fontSize: 13,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 25),
        // Use a Wrap or a Column instead of conditional Flex to be safer
        LayoutBuilder(
          builder: (context, constraints) {
            bool useVertical = constraints.maxWidth < 400;
            if (useVertical) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildEmailInput(),
                  const SizedBox(height: 15),
                  _SubscribeButton(),
                ],
              );
            }
            return Row(
              children: [
                Expanded(child: _buildEmailInput()),
                const SizedBox(width: 15),
                _SubscribeButton(),
              ],
            );
          },
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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white54,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final bool isTitle;

  const _FooterLink({required this.text, this.isTitle = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isTitle ? 20 : 12),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: isTitle ? Colors.white : Colors.white54,
          fontSize: isTitle ? 16 : 13,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final dynamic icon;

  const _SocialIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: FaIcon(icon, color: Colors.white54, size: 16),
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
