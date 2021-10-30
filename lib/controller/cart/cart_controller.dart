import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt cartItemsLength = 0.obs;

  // on dispose
  @override
  void dispose() {
    super.dispose();
    cartItemsLength.close();
  }
}
