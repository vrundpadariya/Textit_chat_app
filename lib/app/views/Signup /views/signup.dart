import 'package:chat_app/app/views/Signup%20/views/String/strin.dart';
import 'package:chat_app/app/views/login/views/string/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login/components/components.dart';
import '../../login/controller/login.dart';

class signup extends StatelessWidget {
  signup({super.key});
  final _texit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  child: Text(
                    "Sign up to Chatbox",
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
              height: 300,
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
                          snameCon.text = val!;
                        },
                        controller: snameCon,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: "name ",
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
                        onChanged: (String? val) {
                          semailCon.text = val!;
                        },
                        controller: semailCon,
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
                        onChanged: (String? val) {
                          spass.text = val!;
                        },
                        controller: spass,
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
                    Container(
                      height: 50,
                      width: 380,
                      decoration: const BoxDecoration(),
                      child: TextFormField(
                        onChanged: (String? val) {
                          spassCon.text = val!;
                        },
                        controller: spassCon,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Confirm password",
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
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (_texit.currentState!.validate() &&
                    spass.text == spassCon.text) {
                  Signup(
                    email: semailCon.text,
                    password: spass.text,
                  );
                  semailCon.clear();
                  spassCon.clear();
                  spass.clear();
                  snameCon.clear();
                  LoginController().showLoading();
                } else {
                  LoginController().hideLoading();
                }
              },
              child: const Text("Sign up"),
            ),
            const SizedBox(
              height: 30,
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
              height: 30,
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
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/login');
              },
              child: const Text(
                "Already account? login In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
