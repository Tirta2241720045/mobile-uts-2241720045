import 'dart:async';
import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _carouselIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_carouselIndex < 6) {
        // 6 karena index mulai dari 0
        _carouselIndex++;
      } else {
        _carouselIndex = 0; // Kembali ke awal setelah mencapai akhir
      }
      _pageController.animateToPage(
        _carouselIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hentikan timer saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns the column to the start
      children: [
        SizedBox(
          height: 250, // Adjusted height to match LatestUpdatesWidget
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _carouselIndex = index),
            itemCount: 7, // Updated to 7 images
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 8), // Margin for spacing
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == 0 ? Colors.orange : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/promo/promo${index + 1}.png',
                    fit: BoxFit.cover,
                    width: double
                        .infinity, // Ensures the image fills the container
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Align(
      alignment: Alignment.centerLeft, // Align to the left
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0), // Add some left padding
        child: Row(
          mainAxisSize: MainAxisSize.min, // Use minimum size for the row
          children: List.generate(7, (index) {
            // Updated to 7 indicators
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: _carouselIndex == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _carouselIndex == index ? Colors.red : Colors.grey,
              ),
            );
          }),
        ),
      ),
    );
  }
}
