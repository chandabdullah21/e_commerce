import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/auth/phone/controller/phone_controller.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);

  // var phoneController = PhoneController();

  @override
  Widget build(BuildContext context) {
    final PhoneController phoneController = Get.put(PhoneController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onVerticalDragStart: (drag) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   centerTitle: true,
        //   iconTheme: const IconThemeData(
        //     color: AppColors.secondaryColor,
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   title: const Text(
        //     "Login to $appName",
        //     style: TextStyle(
        //       color: AppColors.secondaryColor,
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Form(
              key: phoneController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconButton(
                    iconData: EvaIcons.arrowIosBackOutline,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const SpaceH20(),
                  Text(
                    "Get Started with\n$appName",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SpaceH12(),
                  Text(
                    "Enter you phone number to get start with $appName",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                  ),
                  const SpaceH30(),
                  CustomPhoneInput(
                    autoFocus: true,
                    controller: phoneController.phoneNumberController,
                    onCountryChange: phoneController.onCountryChange,
                    formValidator: MultiValidator([
                      RequiredValidator(errorText: 'phone number is required'),
                    ]),
                  ),
                  const Spacer(),
                  CustomPrimaryButton(
                    text: "Get Start",
                    onPress: phoneController.onGetStart,
                  ),
                  const SpaceH30(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
