import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PackageButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? background;

  const PackageButton({super.key, this.onTap, this.background});

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
              color: background ?? Colors.transparent,
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
