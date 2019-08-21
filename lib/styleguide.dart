import 'package:flutter/material.dart';

class AppTheme{

  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.8),
    fontSize: 34,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );

  static TextStyle subHeading = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.8),
    fontSize: 24,
    fontWeight: FontWeight.w500,
    inherit: true
  );
}