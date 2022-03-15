import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
              borderRadius: BorderRadius.circular(kBorderRadius * 5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            Container(
              padding: EdgeInsets.all(kPadding / 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius * 5),
              ),
              child: const Icon(
                EvaIcons.arrowIosForwardOutline,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.onButtonClick,
    required this.buttonText,
  }) : super(key: key);

  Function() onButtonClick;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonClick,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 15,
              color: AppColors.primaryColor,
            ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          AppColors.primaryColor.withOpacity(.1),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  IconData iconData;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kPadding / 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kBorderRadius),
          boxShadow: const [
            BoxShadow(
              blurRadius: kBorderRadius,
              color: AppColors.grey,
            ),
          ],
        ),
        child: Icon(
          iconData,
          color: AppColors.secondaryColor,
          size: 30,
        ),
      ),
    );
  }
}
