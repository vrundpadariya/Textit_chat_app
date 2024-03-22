import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.toNamed('/intr');
    });
    return Scaffold(
      backgroundColor: const Color(0xfff4f7fb),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "asset/spal2.gif",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            const Text(
              "Texit",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 5,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
