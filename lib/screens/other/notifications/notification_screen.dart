import 'package:badges/badges.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
                title: "Notifications",
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
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPadding / 1.5,
                      ),
                      height: 2,
                      color: AppColors.grey50,
                    );
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minVerticalPadding: 17,
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(kBorderRadius * 5),
                        ),
                        child: const Icon(
                          EvaIcons.percentOutline,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text(
                        "50% OFF of everything at HomeMade Decords",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Yesterday",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: -.5,
                                    ),
                          ),
                          Badge(
                            badgeContent: const Text(
                              "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            badgeColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: CustomEmptyWidget(
              //     packageImage: PackageImage.Image_1,
              //     title: "No Message",
              //     subtitle: "No message available yet!",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
