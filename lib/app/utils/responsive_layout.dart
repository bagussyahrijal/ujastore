import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;

  const ResponsiveLayout({super.key, 
    required this.mobileLayout,
    required this.tabletLayout,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600; // Deteksi apakah perangkat tablet atau mobile

    return isTablet ? tabletLayout : mobileLayout;
  }
}
