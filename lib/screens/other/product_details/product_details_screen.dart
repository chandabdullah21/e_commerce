import 'package:badges/badges.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/other/product_details/components/product_slider.dart';
import 'package:e_commerce/screens/other/product_details/components/footer.dart';
import 'package:e_commerce/screens/other/product_details/components/product_segments.dart';
import 'package:e_commerce/screens/other/product_details/controller/product_detail_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController =
        Get.put(ProductDetailController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SpaceH20(),
              ProductSlider(),
              SpaceH20(),
              ProductSegments(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          EvaIcons.arrowIosBackOutline,
          color: AppColors.primaryColor,
          size: 35,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Men Casual Shirt",
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "\$49.99",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SpaceW8(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding / 2,
                  vertical: kPadding / 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(kBorderRadius * 3),
                ),
                child: Row(
                  children: [
                    const Icon(
                      EvaIcons.star,
                      size: 15,
                    ),
                    const SpaceW4(),
                    Text(
                      "4.9",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SpaceH8(),
        ],
      ),
      actions: [
        Badge(
          padding: const EdgeInsets.all(kPadding / 3),
          badgeColor: AppColors.primaryColor,
          badgeContent: Text(
            "7",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColors.white,
                ),
          ),
          position: BadgePosition.bottomStart(
            bottom: 0,
            start: 0,
          ),
          child: IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(
              EvaIcons.shoppingCartOutline,
              color: AppColors.secondaryColor,
              size: 27,
            ),
          ),
        ),
      ],
    );
  }
}
