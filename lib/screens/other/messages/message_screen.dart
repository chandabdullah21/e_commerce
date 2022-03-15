import 'package:badges/badges.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/widgets/custom_header.dart';
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
                    return MessageListTile(
                      context,
                      TextAvatar(
                        text: "khubaib Rasheed",
                        numberLetters: 2,
                        size: 50,
                        fontSize: 20,
                        shape: Shape.Circular,
                      ),
                      "Khubaib Rasheed",
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      "2:00 AM",
                      "4",
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

  Widget MessageListTile(
    BuildContext context,
    Widget leadingWidget,
    String title,
    String subtitle,
    String time,
    String messagesCount,
  ) {
    return ListTile(
      minVerticalPadding: 17,
      leading: leadingWidget,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  letterSpacing: -.5,
                ),
          ),
          Badge(
            badgeContent: Text(
              messagesCount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            badgeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
