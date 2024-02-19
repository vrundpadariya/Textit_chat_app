import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'intr');
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "lib/app/asset/Splash.jpg",
            ),
          ),
        ),
        child: Text(
          "Textit",
          style: GoogleFonts.acme(
            fontSize: 80,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
