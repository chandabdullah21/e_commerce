import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:e_commerce/widgets/custom_message_notification_icon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    iconList: notificationMessageIcons,
                    title: "Search",
                  ),
                  const SpaceH12(),
                  CustomInput(
                    isObscure: false,
                    title: "",
                    hint: "Search something...",
                    textInputType: TextInputType.text,
                    icon: EvaIcons.searchOutline,
                  ),
                  const SpaceH12(),
                  _text_button_row(
                    context,
                    "Recently viewed",
                    "Clear",
                    () {},
                  ),
                  Container(
                    height: 100,
                    color: AppColors.primaryColor,
                  ),
                  _text_button_row(
                    context,
                    "Recommended",
                    "Refresh",
                    () {},
                  ),
                  Wrap(
                    children: [
                      _chip('Denim Jeans', () {}),
                      _chip('Jeans', () {}),
                      _chip('Shirt', () {}),
                      _chip('Men Clothes', () {}),
                      _chip('Electronics', () {}),
                      _chip('bed', () {}),
                      _chip('Baby walker', () {}),
                      _chip('Watches for men', () {}),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chip(String text, Function() onPress) {
    return Padding(
      padding: const EdgeInsets.only(right: kPadding / 3),
      child: ActionChip(
        onPressed: onPress,
        pressElevation: 2,
        label: Text(
          text,
        ),
        padding: const EdgeInsets.all(kPadding / 2),
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kBorderRadius,
            ),
            side: const BorderSide(color: AppColors.grey50)),
      ),
    );
  }

  Widget _text_button_row(
    BuildContext context,
    String text,
    String buttonText,
    Function() onButtonClick,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 17,
              ),
        ),
        CustomTextButton(
          onButtonClick: onButtonClick,
          buttonText: buttonText,
        ),
      ],
    );
  }
}
