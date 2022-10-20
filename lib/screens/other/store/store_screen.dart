import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:segment_control/segment_control.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              sliverAppBar(context),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: AppColors.secondaryColor,
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        text: "Home",
                      ),
                      Tab(
                        text: "Products",
                      ),
                      Tab(
                        text: "Reviews",
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Trending',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SpaceH12(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Swiper(
                    onTap: (index) {},
                    itemCount: 3,
                    autoplay: true,
                    autoplayDelay: 5000,
                    loop: true,
                    pagination: const SwiperPagination(),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomNetworkImage(
                        imagePath: index == 0
                            ? "https://www.veeqo.com/wp-content/uploads/2019/02/FAceboook-ecommerce-banner-ads.jpg"
                            : index == 1
                                ? "https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Professional-E-Commerce-Shoes-Banner-Design.jpg"
                                : "https://frameru.com/wp-content/uploads/2021/06/Fashion-sale-banner-banner-design-template.jpg",
                        boxfit: BoxFit.cover,
                        borderRadius: kBorderRadius,
                        height: 200,
                      );
                    },
                  ),
                ),
                const SpaceH12(),
                Text(
                  'Hot Deals',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SpaceH12(),
                Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SpaceW12(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return hotDealCard(context, index);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container hotDealCard(BuildContext context, index) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 150,
                child: CustomNetworkImage(
                  imagePath:
                      "http://cdn.shopify.com/s/files/1/0081/3504/9293/collections/Men_s-Coats-_-Blazzers_1200x1200.jpg?v=1564476343",
                  boxfit: BoxFit.cover,
                  borderRadius: kBorderRadius,
                  height: 150,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kBorderRadius),
                        bottomLeft: Radius.circular(kBorderRadius),
                      )),
                  child: Text(
                    "${(index + 1) * 10}%",
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            "Men Casual Coat",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: "\$59.99 ",
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: " \$99.99",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget sliverAppBar(context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryColor,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            EvaIcons.searchOutline,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "ELEGANCE",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: AppColors.white,
                  ),
            ),
            Text(
              "All your fashion needs under on roof",
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ],
        ),
        background: CustomNetworkImage(
          imagePath:
              "https://media.istockphoto.com/photos/mens-suits-on-hangers-in-different-colors-picture-id887360960?k=20&m=887360960&s=612x612&w=0&h=N0k2yX9noV6kNgpmKbcSXaLOl2x8Mbt_lyppAmfhNcA=",
          boxfit: BoxFit.cover,
          borderRadius: 0,
          height: 100,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: AppColors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
