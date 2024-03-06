import 'package:chat_app/app/utilies/string.dart';
import 'package:chat_app/app/views/login/model/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilies/auth_helper.dart';
import '../components/components.dart';
import '../controller/login.dart';
import '../model/login.dart';

class login extends StatelessWidget {
  login({super.key});
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  child: Text(
                    "Log in to Chatbox",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 350,
                  child: Text(
                    "Welcome back! Sign in using your social \n account or email to continue us",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 380,
              decoration: const BoxDecoration(),
              child: TextFormField(
                onChanged: (val) {
                  email = val;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email ",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 380,
              decoration: const BoxDecoration(),
              child: TextFormField(
                obscureText: controller.password.isVisible,
                onChanged: (val) {
                  password = val;
                },
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "password ",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                LoginCredentials credentials = LoginCredentials(
                    email: email ?? "", password: password ?? "");
                Map<String, dynamic> res = await AuthHelper.authHelper.signUp(
                    signUpModel:
                        SignUpModel(email: 'email', password: 'password'));
                if (res['error'] != null) {
                  Fluttertoast.showToast(
                      msg: "Sign up failed", textColor: Colors.red);
                } else {
                  sEmailController.clear();
                  sPasswordController.clear();
                  Fluttertoast.showToast(
                      msg: "Sign up Success", textColor: Colors.black);
                }
              },
              child: Text("Sign up"),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: google,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "lib/app/asset/google.png",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "lib/app/asset/facebook.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "lib/app/asset/github.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("")
          ],
        ),
      ),
    );
  }
}
