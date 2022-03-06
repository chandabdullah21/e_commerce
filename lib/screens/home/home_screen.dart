import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Badge(
            badgeContent: const Text(
              '5',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            position: BadgePosition.bottomStart(
              bottom: 3,
              start: 3,
            ),
            badgeColor: AppColors.primaryColor,
            child: IconButton(
              splashRadius: 23,
              onPressed: () {},
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
              ),
            ),
            position: BadgePosition.bottomStart(
              bottom: 3,
              start: 3,
            ),
            badgeColor: AppColors.primaryColor,
            child: IconButton(
              splashRadius: 23,
              onPressed: () {},
              icon: const Icon(
                EvaIcons.bellOutline,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SpaceH12(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SpaceW12(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://www.kindpng.com/picc/m/463-4635103_t-shirts-apparel-uberconference-icon-hd-png-download.png"),
                      ),
                      FittedBox(
                        child: Text(
                          "Apparel",
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.red,
            //       ),
            //       Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.blue,
            //       ),
            //       Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.green,
            //       ),
            //       Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.yellow,
            //       ),
            //       Container(
            //         width: 100,
            //         height: 100,
            //         color: Colors.orange,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
