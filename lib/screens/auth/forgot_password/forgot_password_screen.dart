import 'package:e_commerce/screens/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController forgotPasswordController =
        Get.put(ForgotPasswordController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onVerticalDragStart: (drag) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: _form(forgotPasswordController, context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _form(
      ForgotPasswordController forgotPasswordController, BuildContext context) {
    return Form(
      key: forgotPasswordController.formKey,
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
            "FORGOT_PASSWORD".tr,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SpaceH12(),
          Text(
            "FORGOT_PASSWORD_CAPTION".tr,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: AppColors.secondaryColor,
                ),
          ),
          const SpaceH30(),
          CustomInput(
            icon: EvaIcons.emailOutline,
            title: "EMAIL".tr,
            hint: "ENTER_YOUR_EMAIL".tr,
            isObscure: false,
            textInputType: TextInputType.emailAddress,
            controller: forgotPasswordController.emailController,
            formValidator: MultiValidator([
              RequiredValidator(errorText: 'EMAIL_IS_REQUIRED'.tr),
              EmailValidator(errorText: "INVALID_EMAIL".tr),
            ]),
          ),
          const SpaceH30(),
          CustomPrimaryButton(
            text: "SEND_EMAIL".tr,
            onPress: () {
              forgotPasswordController.onSendEmailClick();
            },
          ),
          const SpaceH30(),
        ],
      ),
    );
  }
}
