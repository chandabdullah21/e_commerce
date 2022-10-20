import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:e_commerce/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.percentageOff,
    required this.title,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.imageHeight,
  }) : super(key: key);

  Function() onTap;
  String imageUrl, title;
  double price, rating, percentageOff, imageHeight;
  int ratingCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: kBoxShadow,
              blurStyle: BlurStyle.outer,
              color: AppColors.grey,
            ),
          ],
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageUrl != "")
              Stack(
                children: [
                  CustomNetworkImage(
                    imagePath: imageUrl,
                    boxfit: BoxFit.contain,
                    borderRadius: 0,
                    height: imageHeight,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: kPadding / 4,
                        horizontal: kPadding / 2,
                      ),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(kBorderRadius),
                            bottomLeft: Radius.circular(kBorderRadius),
                          )),
                      child: Text(
                        "-${percentageOff.toStringAsFixed(0)}%",
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SpaceH2(),
            Padding(
              padding: const EdgeInsets.all(kPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SpaceH2(),
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: "\$${price.toStringAsFixed(2)} ",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          TextSpan(
                            text: "\$${price.toStringAsFixed(2)} ",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          )
                        ]),
                  ),
                  const SpaceH2(),
                  Wrap(
                    children: [
                      CustomRatingBar(
                        value: double.parse(
                          rating.toString(),
                        ),
                        allowHalfRating: true,
                      ),
                      const SpaceW4(),
                      Text(
                        "(${ratingCount})",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColors.black50,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
