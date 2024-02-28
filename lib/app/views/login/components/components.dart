import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utilies/auth_helper.dart';
import '../../../utilies/cloudfirestore.dart';

onGoogleSignin() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.googleSignin();
  if (res['error'] != null) {
    Fluttertoast.showToast(msg: "Login failed", textColor: Colors.red);
  } else {
    Get.toNamed('/home');
    Fluttertoast.showToast(msg: "Login Success", textColor: Colors.black);
    CloudFireStoreHelper.fireStoreHelper.addUser();
  }
}
