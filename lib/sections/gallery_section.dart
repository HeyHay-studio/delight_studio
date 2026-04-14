import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

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
          Text(
            'Our Gallery',
            style: Theme.of(context).textTheme.displaySmall,
          ).animate().fadeIn(),
          const SizedBox(height: 60),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
            children: [
              _GalleryImage(assetPath: 'assets/gallery_1.png', delay: 0),
              _GalleryImage(assetPath: 'assets/gallery_2.png', delay: 200),
              _GalleryImage(assetPath: 'assets/gallery_3.png', delay: 400),
            ],
          ),
        ],
      ),
    );
  }
}

class _GalleryImage extends StatelessWidget {
  final String assetPath;
  final int delay;
  final bool? isNetwork;

  const _GalleryImage({
    required this.assetPath,
    required this.delay,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            border: Border.all(color: Colors.white10, width: 1),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              isNetwork!
                  ? Image.network(
                      assetPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.white24,
                              size: 50,
                            ),
                          ),
                    )
                  : Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.white24,
                              size: 50,
                            ),
                          ),
                    ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withAlpha(80), Colors.transparent],
                  ),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: delay.ms, duration: 800.ms)
        .scale(begin: const Offset(0.9, 0.9));
  }
}
