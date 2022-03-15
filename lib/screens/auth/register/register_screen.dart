import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/auth/register/controller/register_controller.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  // var registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onVerticalDragStart: (drag) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: _footer(context),
        resizeToAvoidBottomInset: false, //new line
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: _form(registerController, context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _form(RegisterController registerController, BuildContext context) {
    return Form(
      key: registerController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SIGN_UP".tr,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SpaceH48(),
          Row(
            children: [
              Expanded(
                child: CustomInput(
                  icon: EvaIcons.personOutline,
                  title: "FIRST".tr,
                  hint: "",
                  isObscure: false,
                  textInputType: TextInputType.name,
                  controller: registerController.firstNameController,
                  formValidator: MultiValidator([
                    RequiredValidator(errorText: 'NAME_IS_REQUIRED'.tr),
                  ]),
                ),
              ),
              const SpaceW12(),
              Expanded(
                child: CustomInput(
                  title: "LAST_NAME".tr,
                  hint: "",
                  isObscure: false,
                  textInputType: TextInputType.name,
                  controller: registerController.lastNameController,
                  formValidator: MultiValidator([
                    RequiredValidator(errorText: 'NAME_IS_REQUIRED'.tr),
                  ]),
                ),
              ),
            ],
          ),
          const SpaceH30(),
          CustomInput(
            icon: EvaIcons.emailOutline,
            title: "EMAIL".tr,
            hint: "ENTER_YOUR_EMAIL".tr,
            isObscure: false,
            textInputType: TextInputType.emailAddress,
            controller: registerController.emailController,
            formValidator: MultiValidator([
              RequiredValidator(errorText: 'EMAIL_IS_REQUIRED'.tr),
              EmailValidator(errorText: "INVALID_EMAIL".tr),
            ]),
          ),
          const SpaceH30(),
          CustomInput(
            icon: EvaIcons.lockOutline,
            title: "PASSWORD".tr,
            hint: "ENTER_YOU_PASSWORD".tr,
            isObscure: true,
            textInputType: TextInputType.visiblePassword,
            controller: registerController.passwordController,
            formValidator: MultiValidator([
              RequiredValidator(errorText: 'PASSWORD_IS_REQUIRED'.tr),
              MinLengthValidator(6,
                  errorText: "PASSWORD_MUST_BE_GREATER_THAN_6_CHARACTERS".tr)
            ]),
          ),
          const SpaceH30(),
          CustomPrimaryButton(
            text: "REGISTER".tr,
            onPress: () {
              registerController.onRegisterClick();
            },
          ),
          const SpaceH12(),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kBottomPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "ALREADY_HAVE_AN_ACCOUNT".tr,
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              "LOGIN_NOW".tr,
              style: const TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
