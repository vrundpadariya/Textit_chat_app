import 'package:chat_app/app/views/login/views/string/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/components.dart';
import '../controller/login.dart';

class login extends StatelessWidget {
  login({super.key});

  final _texit = GlobalKey<FormState>();

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
              height: 150,
              width: double.infinity,
              child: Form(
                key: _texit,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 380,
                      decoration: const BoxDecoration(),
                      child: TextFormField(
                        onChanged: (String? val) {
                          emailController.text = val!;
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
                        onChanged: (String? val) {
                          passwordController.text = val!;
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (_texit.currentState!.validate()) {
                  LoginController().showLoading();
                  Login(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                } else {
                  LoginController().hideLoading();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid Email or Password'),
                    ),
                  );
                  passwordController.clear();
                  emailController.clear();
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Divider(
                  height: 5,
                  color: Colors.black,
                  endIndent: 35,
                  indent: 35,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  color: Colors.white,
                  child: const Text("OR"),
                ),
              ],
            ),
            const SizedBox(
              height: 90,
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
                          "asset/google.png",
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
                        "asset/facebook.png",
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
                        "asset/github.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/signup');
              },
              child: const Text(
                "Create account? logim In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
