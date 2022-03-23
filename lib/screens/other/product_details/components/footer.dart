import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: kPadding,
        left: kPadding,
        bottom: kBottomPadding(context),
        top: kPadding / 4,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomPrimaryButton(
              text: "SHARE THIS",
              onPress: () {},
              color: AppColors.white,
              textColor: AppColors.secondaryColor,
              icon: EvaIcons.arrowUpwardOutline,
              isSmallText: true,
            ),
          ),
          const SpaceW8(),
          Expanded(
            child: CustomPrimaryButton(
              text: "ADD TO CART",
              onPress: () {},
              isSmallText: true,
            ),
          ),
        ],
      ),
    );
  }
}
