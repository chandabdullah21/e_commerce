import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/other/product_details/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:e_commerce/widgets/custom_rating_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:readmore/readmore.dart';

class ProductSegments extends StatelessWidget {
  const ProductSegments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController =
        Get.put(ProductDetailController());
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              segmentChip(
                context,
                "Product",
                productDetailController.selectedSegment.value == "Product",
                productDetailController,
              ),
              segmentChip(
                context,
                "Details",
                productDetailController.selectedSegment.value == "Details",
                productDetailController,
              ),
              segmentChip(
                context,
                "Review",
                productDetailController.selectedSegment.value == "Review",
                productDetailController,
              ),
            ],
          ),
          const SpaceH12(),
          productDetailController.selectedSegment.value == "Product"
              ? productSegemnt(context)
              : productDetailController.selectedSegment.value == "Details"
                  ? detailSegment(context)
                  : reviewsSegment(),
        ],
      ),
    );
  }

  Widget segmentChip(
    BuildContext context,
    String value,
    bool isSelected,
    ProductDetailController productDetailController,
  ) {
    return ActionChip(
      padding: const EdgeInsets.symmetric(horizontal: kPadding / 2),
      label: Text(
        value,
        style: Theme.of(context).textTheme.button!.copyWith(
              color: isSelected ? AppColors.white : AppColors.secondaryColor,
            ),
      ),
      onPressed: () {
        productDetailController.segementClick(value);
      },
      backgroundColor: isSelected ? AppColors.primaryColor : AppColors.white,
      pressElevation: 0,
      side: BorderSide(
        color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
      ),
    );
  }

  Widget productSegemnt(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Color",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.secondaryColor,
                ),
          ),
          const SpaceH8(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SpaceW12(),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFAD9076),
                    shape: BoxShape.circle,
                  ),
                  child: index == 1
                      ? const Icon(
                          EvaIcons.checkmark,
                          color: AppColors.white,
                          size: 30,
                        )
                      : null,
                );
              },
            ),
          ),
          const SpaceH16(),
          Text(
            "Select Size",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.secondaryColor,
                ),
          ),
          const SpaceH8(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SpaceW12(),
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    border: Border.all(
                      color: index == 2
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                    ),
                  ),
                  child: Text(
                    "3${index}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: index == 2
                              ? AppColors.primaryColor
                              : AppColors.secondaryColor,
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget detailSegment(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          detailRow(context, "Brand", "Nike", "SKU", "nk1234567890"),
          const SpaceH16(),
          detailRow(context, "Condition", "Brand new, with box", "Material",
              "Pure Cotton"),
          const SpaceH16(),
          detailRow(context, "Category", "Appreal", "Fitting", "True to size"),
          const SpaceH16(),
          ListTile(
            onTap: () {
              Get.toNamed("/store");
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: kPadding / 2),
            leading: Container(
              width: 70,
              padding: const EdgeInsets.only(right: 12.0),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: Colors.black26),
                ),
              ),
              child: CustomNetworkImage(
                imagePath:
                    "http://cdn.shopify.com/s/files/1/0081/3504/9293/collections/Men_s-Coats-_-Blazzers_1200x1200.jpg?v=1564476343",
                boxfit: BoxFit.cover,
                borderRadius: kBorderRadius,
                height: 70,
              ),
            ),
            title: const Text(
              "ELEGANCE",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: const [
                Icon(
                  Icons.store_mall_directory_rounded,
                  color: AppColors.secondaryColor,
                ),
                Text(
                  " Visit Store",
                  style: TextStyle(color: AppColors.secondaryColor),
                )
              ],
            ),
            trailing: const Icon(
              EvaIcons.chevronRightOutline,
              color: AppColors.secondaryColor,
            ),
          ),
          const SpaceH16(),
        ],
      ),
    );
  }

  Widget detailRow(context, title1, value1, title2, value2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title1,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.secondaryColor,
                    ),
              ),
            ),
            const SpaceW4(),
            Expanded(
              child: Text(
                title2,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.secondaryColor,
                    ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                value1,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SpaceW4(),
            Expanded(
              child: Text(
                value2,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget reviewsSegment() {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        color: AppColors.grey50,
        width: widthOfScreen(context),
        height: 2,
      ),
      primary: true,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding,
            vertical: kPadding / 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextAvatar(
                text: "Khubaib Rasheed",
                fontSize: 20,
                numberLetters: 2,
                shape: Shape.Circular,
                size: 70,
              ),
              const SpaceW12(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRatingBar(
                          value: 3.5,
                          allowHalfRating: false,
                        ),
                        Text(
                          "27 Nov, 2020",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    Text(
                      "Khubaib Rasheed",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    ReadMoreText(
                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: Theme.of(context).textTheme.subtitle1,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                      lessStyle:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
