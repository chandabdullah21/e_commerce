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
        resizeToAvoidBottomInset: false, //new line
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Form(
              key: loginController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Log In",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SpaceH48(),
                  CustomInput(
                    icon: EvaIcons.emailOutline,
                    title: "Email",
                    hint: "Enter your email",
                    isObscure: false,
                    textInputType: TextInputType.emailAddress,
                    controller: loginController.emailController,
                    formValidator: MultiValidator([
                      RequiredValidator(errorText: 'email is required'),
                      EmailValidator(errorText: "invalid email"),
                    ]),
                  ),
                  const SpaceH30(),
                  CustomInput(
                    icon: EvaIcons.lockOutline,
                    title: "Password",
                    hint: "Enter you password",
                    isObscure: true,
                    textInputType: TextInputType.visiblePassword,
                    controller: loginController.passwordController,
                    formValidator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                    ]),
                  ),
                  const SpaceH12(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.black50,
                        ),
                      ),
                    ),
                  ),
                  const SpaceH30(),
                  CustomPrimaryButton(
                    text: "Login",
                    onPress: () {
                      loginController.onLoginClick();
                    },
                  ),
                  const SpaceH30(),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        " Or Login with ",
                        style: TextStyle(
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
                  const Spacer(),
                  SizedBox(
                    width: widthOfScreen(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/register');
                          },
                          child: const Text(
                            "create a new account",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceH12(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
