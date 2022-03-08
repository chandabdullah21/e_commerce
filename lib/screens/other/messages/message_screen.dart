import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/widgets/custom_emply_widget.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kPadding, vertical: kPadding / 2),
          child: Column(
            children: [
              CustomHeader(
                title: "Messages",
                iconList: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      EvaIcons.close,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomEmptyWidget(
                  packageImage: PackageImage.Image_1,
                  title: "No Message",
                  subtitle: "No message available yet!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
