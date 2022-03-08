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

  var registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Form(
              key: registerController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
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
                          title: "First",
                          hint: "",
                          isObscure: false,
                          textInputType: TextInputType.name,
                          controller: registerController.firstNameController,
                          formValidator: MultiValidator([
                            RequiredValidator(errorText: 'name is required'),
                          ]),
                        ),
                      ),
                      const SpaceW12(),
                      Expanded(
                        child: CustomInput(
                          title: "Last Name",
                          hint: "",
                          isObscure: false,
                          textInputType: TextInputType.name,
                          controller: registerController.lastNameController,
                          formValidator: MultiValidator([
                            RequiredValidator(errorText: 'name is required'),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SpaceH30(),
                  CustomInput(
                    icon: EvaIcons.emailOutline,
                    title: "Email",
                    hint: "Enter your email",
                    isObscure: false,
                    textInputType: TextInputType.emailAddress,
                    controller: registerController.emailController,
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
                    controller: registerController.passwordController,
                    formValidator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(6,
                          errorText:
                              "password must be greater than 6 characters.")
                    ]),
                  ),
                  const SpaceH30(),
                  CustomPrimaryButton(
                    text: "Register",
                    onPress: () {
                      registerController.onRegisterClick();
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: widthOfScreen(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text(
                            "login now",
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
