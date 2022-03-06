import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  String text;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: widthOfScreen(context),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(3.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
