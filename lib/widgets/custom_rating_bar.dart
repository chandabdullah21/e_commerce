import 'package:e_commerce/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  double value;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: value,
      allowHalfRating: false,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star_rounded,
          color: AppColors.orangeShade1,
        ),
        half: const Icon(
          Icons.star_half_rounded,
          color: AppColors.orangeShade1,
        ),
        empty: const Icon(
          Icons.star_outline_rounded,
          // color: AppColors.orangeShade1,
          color: AppColors.grey,
        ),
      ),
      onRatingUpdate: (rating) {},
      itemSize: 15,
    );
  }
}
