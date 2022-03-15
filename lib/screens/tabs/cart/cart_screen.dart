import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_message_notification_icon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            children: [
              CustomHeader(
                title: "Cart",
                iconList: notificationMessageIcons,
              ),
              const SpaceH12(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(kPadding / 2),
                      color: AppColors.grey50,
                      height: 2,
                      width: widthOfScreen(context),
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            "https://www.schoolshoes.co.uk/images/departments/1561718768-68821500.jpg",
                          ),
                        ),
                        const SpaceW20(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "School Shoes ",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "9, Black",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SpaceH8(),
                              Text(
                                "\$4.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 19,
                                    ),
                              ),
                              const SpaceH8(),
                              Row(children: const [
                                Icon(
                                  EvaIcons.minusCircle,
                                  color: AppColors.secondaryColor,
                                ),
                                SpaceW8(),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                SpaceW8(),
                                Icon(
                                  EvaIcons.plusCircle,
                                  color: AppColors.secondaryColor,
                                ),
                              ]),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          tooltip: "Remove",
                          splashRadius: 20,
                          icon: const Icon(
                            EvaIcons.trash2Outline,
                            color: AppColors.red,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SpaceH12(),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: kPadding / 3),
                    color: AppColors.grey50,
                    height: 2,
                    width: widthOfScreen(context),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            "Shipping: \$7.00",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            "\$27.00",
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                      const SpaceW48(),
                      Expanded(
                        child: CustomPrimaryButton(
                          text: "Checkout",
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                  const SpaceH8(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
