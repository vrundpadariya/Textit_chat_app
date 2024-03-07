import 'package:chat_app/app/utilies/auth_helper.dart';
import 'package:get/get.dart';

logout() {
  AuthHelper.authHelper.signOut();
  Get.toNamed('/login');
}
