import 'package:flutter/material.dart';

class LatestUpdatesWidget extends StatefulWidget {
  @override
  _LatestUpdatesWidgetState createState() => _LatestUpdatesWidgetState();
}

class _LatestUpdatesWidgetState extends State<LatestUpdatesWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _carouselIndex = 0;

  // List of updates and additional texts for each update
  final List<String> updates = [
    'Promo Cashback 20% untuk pengguna baru',
    'Diskon 50% untuk semua produk elektronik',
    'Gratis ongkir untuk pembelian di atas Rp 100.000',
  ];

  final List<String> additionalTexts = [
    'Berlaku hingga 31 Oktober 2024',
    'Hanya hari ini!',
    'Syarat dan ketentuan berlaku',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with 'Latest Updates'
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Updates',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Carousel with PageView
        SizedBox(
          height:
              250, // Adjusted to fit image, description, extra text, and button
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _carouselIndex = index),
            itemCount: updates.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with rounded corners and shadow
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
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
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    // Main description text
                    Text(
                      updates[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    // Additional smaller text in grey
                    Text(
                      additionalTexts[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Button
                    ElevatedButton(
                      onPressed: () {
                        // Action when button is clicked
                        // You can navigate to another page or show a dialog
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Button clicked for: ${updates[index]}'),
                          ),
                        );
                      },
                      child: Text('Learn More'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        // Page Indicator removed
      ],
    );
  }
}
