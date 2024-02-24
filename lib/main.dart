import 'package:flutter/material.dart';

import 'app/views/intro/intro.dart';
import 'app/views/splash_screen/splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const SplashScreen(),
        'intr': (ctx) => intro(),
      },
    ),
  );
}
