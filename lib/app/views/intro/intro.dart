import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "lib/app/asset/login.jpg",
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 350,
              width: 500,
              child: const Text(
                "Connect \n friends \neasily & \nquickly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 62,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 80,
              width: 500,
              child: Row(
                children: [
                  Text(
                    "Our chat app is the perfect way to stay \nconnected with friends and family.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            "lib/app/asset/google.png",
                          ),
                        )),
                  ),
                  Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            "lib/app/asset/facebook.png",
                          ),
                        )),
                  ),
                  Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            "lib/app/asset/google.png",
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
