import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 350,
      child: Swiper(
        onTap: (index) {},
        itemCount: 3,
        indicatorLayout: PageIndicatorLayout.WARM,
        autoplay: false,
        loop: false,
        pagination: const SwiperPagination(),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CustomNetworkImage(
            imagePath: index == 0
                ? "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
                : index == 1
                    ? "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"
                    : "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
            boxfit: BoxFit.contain,
            borderRadius: 0,
            height: 350,
          );
        },
      ),
    );
  }
}
