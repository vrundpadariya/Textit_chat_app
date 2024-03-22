import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilies/auth_helper.dart';
import '../../../utilies/cloudfirestore.dart';
import '../../login/views/string/string.dart';
import '../model/chatmodel.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> arguments =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController messageController = TextEditingController();
    String? message;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 15,
              foregroundImage: NetworkImage(arguments[1]),
            ),
            SizedBox(
              width: w / 30,
            ),
            Text(arguments[0]),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: fetchedmsg,
              builder: (ctx, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>>? messages =
                      snapshot.data?.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages!.length,
                    itemBuilder: (ctx, i) {
                      return Align(
                        alignment: (arguments[2] != messages[i]['receivedby'])
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Chip(
                          label: Text("${messages[i]['message']}"),
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: chatTextField(
              receiver: arguments[2],
              messageController: messageController,
              onChanged: (val) {
                message = val;
              },
              onPressed: () {
                log("$message");

                Chat chat = Chat(
                  message: message!,
                  receiver: arguments[2],
                  sender: AuthHelper.auth.currentUser!.uid,
                );
                FireStoreHelper.fireStoreHelper.sendMessage(chatdetails: chat);
                messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField chatTextField({
  required String receiver,
  required TextEditingController messageController,
  required ValueChanged<String?> onChanged,
  required VoidCallback onPressed,
}) =>
    TextFormField(
      controller: messageController,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.send),
        ),
        hintText: 'send message....',
      ),
    );
