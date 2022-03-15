import 'package:badges/badges.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final notificationMessageIcons = [
  Badge(
    badgeContent: const Text(
      '5',
      style: TextStyle(
        color: Colors.white,
        fontSize: 10,
      ),
    ),
    position: BadgePosition.bottomStart(
      bottom: 3,
      start: 3,
    ),
    badgeColor: AppColors.primaryColor,
    child: IconButton(
      splashRadius: 23,
      onPressed: () {
        Get.toNamed('/message');
      },
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
        fontSize: 10,
      ),
    ),
    position: BadgePosition.bottomStart(
      bottom: 3,
      start: 3,
    ),
    badgeColor: AppColors.primaryColor,
    child: IconButton(
      splashRadius: 23,
      onPressed: () {
        Get.toNamed('/notification');
      },
      icon: const Icon(
        EvaIcons.bellOutline,
        color: AppColors.secondaryColor,
      ),
    ),
  ),
];
