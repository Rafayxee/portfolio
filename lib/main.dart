import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view/portfolio_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Abdul Rafay - Mobile Application Developer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF111418),
        fontFamily: 'SpaceGrotesk',
      ),
      home: PortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
