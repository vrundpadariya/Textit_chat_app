import 'package:get/get.dart';

import '../model/password.dart';

class LoginController extends GetxController {
  Password password = Password(isVisible: false);

  void changeVisiblity() {
    password.isVisible = !password.isVisible;
    update();
  }
}
