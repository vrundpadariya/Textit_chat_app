import 'package:get/get.dart';

import '../model/password.dart';

class LoginController extends GetxController {
  final RxBool _isLoading = false.obs; // Use RxBool for reactivity

  bool get isLoading => _isLoading.value;
  Password password = Password(isVisible: false);

  void changeVisiblity() {
    password.isVisible = !password.isVisible;
    update();
  }

  void showLoading() {
    _isLoading.value = true;
    update();
  }

  void hideLoading() {
    _isLoading.value = false;
    update();
  }
}
