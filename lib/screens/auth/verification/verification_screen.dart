import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

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
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: AppColors.secondaryColor,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Login to $appName",
            style: TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify your\nPhone Number",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SpaceH12(),
                RichText(
                  text: TextSpan(
                    text:
                        "Enter the verification code sent to your phone number ",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                    children: [
                      TextSpan(
                        text: "+" + Get.arguments["phoneNumber"],
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ],
                  ),
                ),
                const SpaceH30(),
                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    activeColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                    inactiveColor: AppColors.secondaryColor,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  onSubmitted: (pin) {
                    if (pin.length == 6) {
                      Get.offAndToNamed('/nav');
                    }
                  },
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.white,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (pin) {
                    Get.offAndToNamed('/nav');
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
