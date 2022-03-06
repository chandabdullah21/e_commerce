import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showToast(String title, String message, String type, bool isTop) {
  Get.snackbar(
    title,
    message,
    backgroundColor: const Color(0xFFFFFFFF),
    backgroundGradient: type == 'success'
        ? const LinearGradient(colors: [
            Color(0xFF76b852),
            Color(0xFF8DC26F),
          ])
        : const LinearGradient(colors: [
            Color(0xFFf85032),
            Color(0xFFe73827),
          ]),
    snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
    colorText: Colors.white,
    icon: Icon(
      type == 'danger'
          ? EvaIcons.alertTriangleOutline
          : EvaIcons.checkmarkCircle2Outline,
      color: Colors.white,
    ),
  );
}
