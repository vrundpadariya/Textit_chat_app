import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app/views/Signup /views/signup.dart';
import 'app/views/chat /views/chat.dart';
import 'app/views/home/views/home.dart';
import 'app/views/intro/intro.dart';
import 'app/views/login/views/login.dart';
import 'app/views/splash_screen/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/intr',
          page: () => Intro(),
        ),
        GetPage(
          name: '/signup',
          page: () => signup(),
        ),
        GetPage(
          name: '/login',
          page: () => login(),
        ),
        GetPage(
          name: '/home',
          page: () => home(),
        ),
        GetPage(
          name: '/Chat',
          page: () => Chats(),
        ),
      ],
    ),
  );
}
