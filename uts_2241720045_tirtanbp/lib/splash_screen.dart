import 'dart:async';
import 'package:flutter/material.dart';
import './pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: _logoOpacity,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/opening.jpg'),
              fit: BoxFit.contain, // Mengubah dari cover ke contain
              alignment: Alignment.center, // Menambahkan alignment center
            ),
          ),
        ),
      ),
    );
  }
}
