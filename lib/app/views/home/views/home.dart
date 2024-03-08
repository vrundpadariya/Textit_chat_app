import 'package:chat_app/app/utilies/cloudfirestore.dart';
import 'package:chat_app/app/views/home/views/components/componenrts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utilies/auth_helper.dart';
import '../../chat /model/chatmodel.dart';
import '../../login/views/string/string.dart';

class home extends StatelessWidget {
  const home({super.key});
  logout() {
    AuthHelper.authHelper.signOut();
    Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (AuthHelper.auth.currentUser?.photoURL == null)
                      ? const NetworkImage(
                          "https://i.pinimg.com/474x/0f/e9/bb/0fe9bba766201d818d6c5dea51a28957.jpg")
                      : NetworkImage(
                          "${AuthHelper.auth.currentUser?.photoURL}"),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        title: (AuthHelper.auth.currentUser?.displayName == null)
            ? Text(
                "welcome ${AuthHelper.auth.currentUser?.email?.split("@")[0].capitalizeFirst}",
                style: components.textstyletitel(),
              )
            : Text(
                "welcome ${AuthHelper.auth.currentUser?.displayName}",
                style: components.textstyletitel(),
              ),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const FaIcon(
              FontAwesomeIcons.signOut,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FireStoreHelper.fireStoreHelper.userFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? querySnapshot =
                snapshot.data as QuerySnapshot<Map<String, dynamic>>;
            List<QueryDocumentSnapshot<Map<String, dynamic>>> userDocuments =
                querySnapshot.docs;
            return ListView.builder(
              itemCount: userDocuments.length,
              itemBuilder: (context, index) {
                var userData = userDocuments[index].data();
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(userData['dp'] ??
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnX7xVVojADtyqaKH1aeTYlYdkyULtLLM53A&usqp=CAU"),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData['name'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    userData['email'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const VerticalDivider(
                                  width: 5,
                                  color: Colors.black,
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      Chat chatDetails = Chat(
                                        message: '',
                                        receiver: userData['uid'],
                                        sender:
                                            AuthHelper.auth.currentUser!.uid,
                                      );
                                      fetchedmsg = await FireStoreHelper
                                          .fireStoreHelper
                                          .fetchMessage(
                                              chatdetails: chatDetails);
                                      Get.toNamed('/Chat', arguments: [
                                        "${userData['name']}",
                                        "${userData['dp']}",
                                        "${userData['uid']}",
                                      ]);
                                    },
                                    child: FaIcon(FontAwesomeIcons.message)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
