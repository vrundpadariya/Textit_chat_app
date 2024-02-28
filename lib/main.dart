import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app/views/home/views/home.dart';
import 'app/views/login/views/login.dart';
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
        //GetPage(name: '/', page: () => SplashScreen(),),
        //GetPage(name: '/home', page: () => intro(),),
        GetPage(
          name: '/',
          page: () => login(),
        ),
        GetPage(
          name: '/home',
          page: () => home(),
        ),
      ],
    ),
  );
}
