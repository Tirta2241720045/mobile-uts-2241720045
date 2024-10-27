import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/services_grid_widget.dart';
import '../widgets/image_carousel_widget.dart';
import '../widgets/best_deals_widget.dart';
import '../widgets/latest_updates_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              SizedBox(height: 10),
              ServicesGridWidget(),
              SizedBox(height: 16),
              ImageCarouselWidget(),
              SizedBox(height: 30),
              BestDealsWidget(),
              LatestUpdatesWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
