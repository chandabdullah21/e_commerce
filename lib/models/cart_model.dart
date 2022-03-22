import 'package:get/get.dart';

class CartData {
  CartData({
   this.itemName,
   this.itemDetail,
   this.itemCount,
   this.price,
   this.imageUrl,
  });

  String? itemName;
  String? itemDetail;
  double? itemCount;
  double? price;
  String? imageUrl;
}

List<CartData> SampleCartList = <CartData>[
  CartData(
    itemName: "School Bag",
    itemDetail: "M, Red",
    itemCount: 1.0,
    price: 7.00,
    imageUrl:
        "https://static-01.daraz.pk/p/fc10d42d89a652b1788f2b7a0ff4eb3b.jpg",
  ),
  CartData(
    itemName: "School Shoes",
    itemDetail: "9, Black",
    itemCount: 1.0,
    price: 4.00,
    imageUrl:
        "https://www.schoolshoes.co.uk/images/departments/1561718768-68821500.jpg",
  ),
];
