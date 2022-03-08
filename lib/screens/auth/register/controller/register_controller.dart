import 'package:e_commerce/models/models.dart';
import 'package:e_commerce/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController {
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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onRegisterClick() {
    print({
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
    });

    if (formKey.currentState!.validate()) {
      Get.toNamed('/phone');
    }
  }
}
