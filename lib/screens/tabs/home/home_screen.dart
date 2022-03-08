import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/tabs/home/controller/home_controller.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                iconList: [
                  Badge(
                    badgeContent: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    position: BadgePosition.bottomStart(
                      bottom: 3,
                      start: 3,
                    ),
                    badgeColor: AppColors.primaryColor,
                    child: IconButton(
                      splashRadius: 23,
                      onPressed: () {
                        Get.toNamed('/message');
                      },
                      icon: const Icon(
                        EvaIcons.messageCircleOutline,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  Badge(
                    badgeContent: const Text(
                      '10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    position: BadgePosition.bottomStart(
                      bottom: 3,
                      start: 3,
                    ),
                    badgeColor: AppColors.primaryColor,
                    child: IconButton(
                      splashRadius: 23,
                      onPressed: () {
                        Get.toNamed('/notification');
                      },
                      icon: const Icon(
                        EvaIcons.bellOutline,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
                title: "Category",
              ),
              const SpaceH12(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryBox(
                    context,
                    "https://images.squarespace-cdn.com/content/v1/5ae8bd2f89c1723a6f6f557b/1586800948003-ZXYG1AJ4ELC0QYVJ4TBM/apparel+fulfillment?format=1000w",
                    "Apparel",
                  ),
                  CategoryBox(
                    context,
                    "https://upload.wikimedia.org/wikipedia/commons/d/d9/Arduino_ftdi_chip-1.jpg",
                    "Electronics",
                  ),
                  CategoryBox(
                    context,
                    "https://cdn.images.express.co.uk/img/dynamic/109/590x/STATIONARY-664578.jpg",
                    "Stationary",
                  ),
                  Column(
                    children: [
                      Container(
                        width: widthOfScreen(context) * 0.19,
                        height: widthOfScreen(context) * 0.19,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(kBorderRadius * 5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 9,
                              color: AppColors.grey,
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 35,
                        ),
                      ),
                      const SpaceH8(),
                      const FittedBox(
                        child: Text("More"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CategoryBox(BuildContext context, String image, String text) {
    return Column(
      children: [
        Container(
          width: widthOfScreen(context) * 0.19,
          height: widthOfScreen(context) * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius * 5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 9,
                color: AppColors.grey,
              )
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
          ),
        ),
        const SpaceH8(),
        FittedBox(
          child: Text(text),
        ),
      ],
    );
  }
}
