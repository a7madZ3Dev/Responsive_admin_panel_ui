import 'package:flutter/material.dart';

import './extensions.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) => context.width < 850;

  static bool isTablet(BuildContext context) =>
      context.width < 1100 && context.width >= 850;

  static bool isDesktop(BuildContext context) => context.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final double _size = context.width;
    // If our width is more than 1100 then we consider it a desktop
    if (_size >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
