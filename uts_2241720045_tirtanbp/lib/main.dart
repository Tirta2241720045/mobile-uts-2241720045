import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/history_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkAja',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/history': (context) => HistoryPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
