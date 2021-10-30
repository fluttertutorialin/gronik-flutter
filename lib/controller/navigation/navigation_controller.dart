import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/pages/cart_checkout/cart.dart';
import '../../views/pages/home_products/home.dart';
import '../../views/pages/order_track/order_page.dart';
import '../../views/pages/offer_screen/offer.dart';
import '../../views/pages/more/more.dart';

class NavigationController extends GetxController {
  /* <-----------------------> 
    0 = Home
    1 = Order
    2 = Offer
    3 = More    
 <-----------------------> */

// .obs is making this selected menu obserable. It will update the screen when
// the value changes

// Selected Menu
  int selectedMenu = 0;

  /// Update The Menu To Selected Index
  void updateMenu(int index) {
    selectedMenu = index;
    update();
  }

  /// Get Back To Previus content screen
  void getBackPrevScreen() {
    if (selectedMenu <= 1) {
    } else {
      selectedMenu = selectedMenu - 1;
      update();
    }
  }

  /// Return widget based on menu selection
  Widget currentScreen() {
    if (selectedMenu == 0) {
      return HomeContent();
    } else if (selectedMenu == 1) {
      return OrderPage();
    } else if (selectedMenu == 2) {
      return CartScreen();
    } else if (selectedMenu == 3) {
      return OfferPage();
    } else if (selectedMenu == 4) {
      return MorePage();
    } else {
      return HomeContent();
    }
  }
}
