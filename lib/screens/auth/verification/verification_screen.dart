import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                CustomVerificationInput(
                  onSubmitted: (pin) {
                    if (pin.length == 6) {
                      Get.offAndToNamed('/nav');
                    }
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
