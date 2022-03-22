import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/tabs/cart/controllers/cart_controller.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_message_notification_icon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Obx(
            () => Column(
              children: [
                CustomHeader(
                  title: "Cart",
                  iconList: [
                    ...notificationMessageIcons,
                    IconButton(
                      onPressed: () {
                        cartController.onInit();
                      },
                      icon: const Icon(
                        EvaIcons.refreshOutline,
                      ),
                    ),
                  ],
                ),
                const SpaceH12(),
                Expanded(
                  child: cartController.cartList.isEmpty
                      ? Container()
                      : ListView.separated(
                          separatorBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(kPadding / 2),
                              color: AppColors.grey50,
                              height: 2,
                              width: widthOfScreen(context),
                            );
                          },
                          itemCount: cartController.cartList.length,
                          itemBuilder: (context, index) {
                            return _cartItem(
                              context,
                              cartController,
                              cartController.cartList[index],
                              index,
                            );
                          },
                        ),
                ),
                const SpaceH12(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: kPadding / 3),
                      color: AppColors.grey50,
                      height: 2,
                      width: widthOfScreen(context),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "Shipping: \$7.00",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              "\$27.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SpaceW48(),
                        Expanded(
                          child: CustomPrimaryButton(
                            text: "Checkout",
                            onPress: () {},
                          ),
                        ),
                      ],
                    ),
                    const SpaceH8(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _cartItem(
    BuildContext context,
    CartController cartController,
    CartData item,
    int index,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            item.imageUrl!,
          ),
        ),
        const SpaceW20(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.itemName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                item.itemDetail!,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SpaceH8(),
              Text(
                "\$${item.price}",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 19,
                    ),
              ),
              const SpaceH8(),
              Row(children: [
                IconButton(
                  splashRadius: 10,
                  onPressed: () {
                    cartController.onDecrease(index);
                  },
                  icon: const Icon(
                    EvaIcons.minusCircle,
                    color: AppColors.secondaryColor,
                  ),
                ),
                // Obx(
                //   () => Text(
                //     item.itemCount.toStringAsFixed(0),
                //     style: const TextStyle(
                //       fontSize: 17,
                //     ),
                //   ),
                // ),
                Text(
                  item.itemCount!.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                IconButton(
                  splashRadius: 10,
                  onPressed: () {
                    cartController.onIncrease(index);
                  },
                  icon: const Icon(
                    EvaIcons.plusCircle,
                    color: AppColors.secondaryColor,
                    size: 20,
                  ),
                )
              ]),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            cartController.onItemRemove(context, index);
          },
          tooltip: "Remove",
          splashRadius: 20,
          icon: const Icon(
            EvaIcons.trash2Outline,
            color: AppColors.red,
          ),
        )
      ],
    );
  }
}
