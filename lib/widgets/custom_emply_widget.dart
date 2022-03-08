import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';

class CustomEmptyWidget extends StatelessWidget {
  CustomEmptyWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.packageImage,
  }) : super(key: key);
  String title;
  String subtitle;
  PackageImage? packageImage;

  @override
  Widget build(BuildContext context) {
    return empty();
  }

  Widget empty() {
    return Center(
        child: SizedBox(
      height: 500,
      width: 350,
      child: EmptyWidget(
        image: null,
        packageImage: packageImage ?? PackageImage.Image_3,
        title: title,
        subTitle: subtitle,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          color: Color(0xff9da9c7),
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffabb8d6),
        ),
        // Uncomment below statement to hide background animation
        // hideBackgroundAnimation: true,
      ),
    ));
  }
}
