import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/screens/tabs/home/controller/home_controller.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_message_notification_icon.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:e_commerce/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryWidget(context),
                const SpaceH12(),
                SliderWidget(context),
                const SpaceH12(),
                ProductWidget(context, homeController),
                const SpaceH20(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SliderWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Latest",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SpaceH12(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Swiper(
            onTap: (index) {},
            itemCount: 5,
            indicatorLayout: PageIndicatorLayout.SCALE,
            autoplay: true,
            autoplayDelay: 5000,
            loop: true,
            pagination: const SwiperPagination(),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CustomNetworkImage(
                imagePath:
                    "https://i.pinimg.com/originals/ef/cf/6d/efcf6ddcc09ed52beb9a5e8384a960b0.png",
                boxfit: BoxFit.cover,
                borderRadius: kBorderRadius,
                height: 220,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget CategoryWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomHeader(
          iconList: notificationMessageIcons,
          title: "Category",
        ),
        const SpaceH12(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryBox(
              context,
              "https://www.monarchbrands.com/wp-content/uploads/2019/07/Microfiber-Cloth-Stack-2.jpg",
              "Apparel",
            ),
            CategoryBox(
              context,
              "https://images.saymedia-content.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTc0NDY0NTMyOTQzNDgwNDU0/buying-your-first-desktop-computer.jpg",
              "Electronics",
            ),
            CategoryBox(
              context,
              "https://media.architecturaldigest.com/photos/5f4e9c54072307c75638c0f1/1:1/w_1280%2Cc_limit/Screen%2520Shot%25202020-09-01%2520at%25203.08.43%2520PM.png",
              "Furniture",
            ),
            Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(kBorderRadius * 5),
                  onTap: () {
                    Get.toNamed('/category');
                  },
                  child: Container(
                    width: widthOfScreen(context) * 0.19,
                    height: widthOfScreen(context) * 0.19,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kBorderRadius * 5),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 7,
                          color: AppColors.grey,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 35,
                    ),
                  ),
                ),
                const SpaceH8(),
                const FittedBox(
                  child: Text("More"),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget CategoryBox(BuildContext context, String image, String text) {
    return Column(
      children: [
        Container(
          width: widthOfScreen(context) * 0.19,
          height: widthOfScreen(context) * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius * 5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 7,
                color: AppColors.grey,
              )
            ],
          ),
          child: CustomNetworkImage(
            imagePath: image,
            boxfit: BoxFit.cover,
            borderRadius: kBorderRadius * 5,
            height: widthOfScreen(context) * 0.19,
          ),
        ),
        const SpaceH8(),
        FittedBox(
          child: Text(text),
        ),
      ],
    );
  }

  Widget ProductWidget(BuildContext context, HomeController homeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Our Products",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SpaceH12(),
        Obx(
          () => StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              for (var index = 0;
                  index < homeController.productList.length;
                  index++)
                InkWell(
                  onTap: () {
                    // print(homeController.productList[index].image);
                    Get.toNamed('product-details');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(kPadding / 2),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: kBoxShadow,
                          blurStyle: BlurStyle.outer,
                          color: AppColors.grey,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (homeController.productList[index].image != null)
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 150,
                            ),
                            child: Image(
                              image: NetworkImage(
                                homeController.productList[index].image!,
                              ),
                            ),
                          ),
                        const SpaceH2(),
                        Text(
                          homeController.productList[index].title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SpaceH2(),
                        Text(
                          "\$${homeController.productList[index].price.toString()}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SpaceH2(),
                        Wrap(
                          children: [
                            CustomRatingBar(
                              value: double.parse(
                                homeController.productList[index].rating!.rate
                                    .toString(),
                              ),
                            ),
                            const SpaceW4(),
                            Text(
                              "(${homeController.productList[index].rating!.count})",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: AppColors.black50,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
