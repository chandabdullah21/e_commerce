import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    print(onInit);
    super.onInit();
    print("onItit");
    cartList.value = <CartData>[].obs;
    // cartList.assignAll(SampleCartList);

    cartList.value = SampleCartList;
    cartList.refresh();
    print({SampleCartList.length});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var cartList = <CartData>[].obs;

  onIncrease(index) {
    if (cartList[index].itemCount! >= 1) {
      cartList[index].itemCount = (cartList[index].itemCount! + 1);
    } else {
      cartList[index].itemCount = 1;
    }
  }

  onDecrease(index) {
    if (cartList[index].itemCount! > 1) {
      cartList[index].itemCount = cartList[index].itemCount! - 1;
    } else {
      cartList[index].itemCount = 1;
    }
  }

  onItemRemove(context, index) {
    Get.defaultDialog(
      title: "Remove",
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Text(
          "Are you sure you want to remove the itme from cart?",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      radius: kBorderRadius,
      actions: [
        CustomTextButton(
          onButtonClick: () => Get.back(),
          buttonText: "Close",
          color: AppColors.secondaryColor,
        ),
        CustomTextButton(
          onButtonClick: () {
            print(index);
            cartList.removeAt(index);
            Get.back();
          },
          buttonText: "Remove",
        ),
      ],
      // onCancel: () {
      //   if (Get.isDialogOpen!) {
      //     Get.back();
      //   }
      // },
      // textCancel: "Cancel",
      // cancelTextColor: AppColors.secondaryColor,
      // textConfirm: "Remove",
      // confirmTextColor: AppColors.primaryColor,
      // cancel: Text(
      //   "Cancel",
      //   style: Theme.of(context).textTheme.button,
      // ),
    );
  }
}
