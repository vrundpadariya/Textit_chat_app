import 'package:chat_app/app/views/home/views/components/componenrts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            CircleAvatar(),
          ],
        ),
        title: const Text("Home page"),
        actions: [
          IconButton(
            onPressed: logout(),
            icon: const FaIcon(
              FontAwesomeIcons.signOut,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
