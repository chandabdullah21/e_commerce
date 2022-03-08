import 'package:e_commerce/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({
    Key? key,
    this.iconList,
    required this.title,
  }) : super(key: key);

  List<Widget>? iconList = [];
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (iconList != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: iconList!
                .map(
                  (icon) => icon,
                )
                .toList(),
          ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
