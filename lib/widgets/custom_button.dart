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
    this.color,
    this.textColor,
    this.icon,
    this.isSmallText = false,
  }) : super(key: key);

  String text;
  VoidCallback onPress;
  Color? color;
  Color? textColor;
  IconData? icon;
  bool? isSmallText;

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
            color ?? AppColors.primaryColor,
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: isSmallText == true ? 16 : 19,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(kPadding / 7),
              decoration: BoxDecoration(
                color: textColor ?? Colors.white,
                borderRadius: BorderRadius.circular(kBorderRadius * 5),
              ),
              child: Icon(
                icon ?? EvaIcons.arrowIosForwardOutline,
                color: color ?? AppColors.primaryColor,
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
    this.color,
  }) : super(key: key);

  Function() onButtonClick;
  String buttonText;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonClick,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 15,
              color: color ?? AppColors.primaryColor,
            ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          color != null
              ? color!.withOpacity(.1)
              : AppColors.primaryColor.withOpacity(.1),
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
