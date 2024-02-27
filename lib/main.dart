import 'package:flutter/material.dart';

import 'app/views/login/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //'/': (ctx) => const SplashScreen(),
        //'intr': (ctx) => intro(),
        '/': (ctx) => const login(),
      },
    ),
  );
}
