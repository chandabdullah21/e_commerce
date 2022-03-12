import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/auth/login/controller/login_controller.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:auth_buttons/auth_buttons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // var loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
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
              child: _form(loginController, context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _form(LoginController loginController, BuildContext context) {
    return Form(
      key: loginController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LOGIN".tr,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SpaceH48(),
          CustomInput(
            icon: EvaIcons.emailOutline,
            title: "EMAIL".tr,
            hint: "ENTER_YOUR_EMAIL".tr,
            isObscure: false,
            textInputType: TextInputType.emailAddress,
            controller: loginController.emailController,
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
            controller: loginController.passwordController,
            formValidator: MultiValidator([
              RequiredValidator(errorText: 'PASSWORD_IS_REQUIRED'),
            ]),
          ),
          const SpaceH12(),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "FORGOT_PASSWORD".tr,
                style: const TextStyle(
                  color: AppColors.black50,
                ),
              ),
            ),
          ),
          const SpaceH30(),
          CustomPrimaryButton(
            text: "BUTTON_LOGIN".tr,
            onPress: () {
              loginController.onLoginClick();
            },
          ),
          const SpaceH30(),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "OR_LOGIN_WITH".tr,
                style: const TextStyle(
                  color: AppColors.black50,
                ),
              ),
            ),
          ),
          const SpaceH30(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GoogleAuthButton(
                onPressed: () {},
                style: const AuthButtonStyle(
                  buttonType: AuthButtonType.icon,
                ),
              ),
              FacebookAuthButton(
                onPressed: () {},
                style: const AuthButtonStyle(
                  buttonType: AuthButtonType.icon,
                ),
              ),
            ],
          ),
          // const Spacer(),
          // _footer(context),
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
            "DON_T_HAVE_AN_ACCOUNT".tr,
            style: const TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/register');
            },
            child: Text(
              "CREATE_A_NEW_ACCOUNT".tr,
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
