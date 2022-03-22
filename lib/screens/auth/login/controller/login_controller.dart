import 'package:e_commerce/models/login_models.dart';
import 'package:e_commerce/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLoginClick() {
    LoginData loginData = LoginData(
      email: emailController.text,
      password: passwordController.text,
    );

    print(loginData);

    if (formKey.currentState!.validate()) {
      showToast("Welcome", "Welcome back Abdullah", "success", true);
      Get.offAndToNamed('/nav');
    }
  }
}
