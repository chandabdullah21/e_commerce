import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var selectedSegment = "Product".obs;

  segementClick(value) {
    selectedSegment.value = value;
  }

  @override
  void onInit() {
    print(onInit);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
