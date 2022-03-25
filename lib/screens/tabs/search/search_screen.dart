import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_input.dart';
import 'package:e_commerce/widgets/custom_message_notification_icon.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
                  text_button_row(
                    context,
                    "Recently viewed",
                    "Clear",
                    () {},
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SpaceW12(),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 3,
                          ),
                          width: widthOfScreen(context) * 0.7,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.grey,
                                blurStyle: BlurStyle.normal,
                                blurRadius: 3,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: CustomNetworkImage(
                                  imagePath:
                                      "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
                                  boxfit: BoxFit.contain,
                                  borderRadius: kBorderRadius,
                                  height: 70,
                                ),
                              ),
                              const SpaceW8(),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Black & White Shirt",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      "\$11.99",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  text_button_row(
                    context,
                    "Recent Searched",
                    "clear",
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

  Widget text_button_row(
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
