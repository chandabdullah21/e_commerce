import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';

class PhoneController extends GetxController {
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

  RxString countryCode = "92".obs;
  TextEditingController phoneNumberController = TextEditingController();

  onGetStart() {
    if (formKey.currentState!.validate()) {
      print(countryCode + phoneNumberController.text);
      Get.toNamed(
        '/verification',
        arguments: {
          "phoneNumber": countryCode + phoneNumberController.text,
        },
      );
    }
  }

  onCountryChange(Country country) {
    print(country.dialCode);
    countryCode = country.dialCode.obs;
  }
}
