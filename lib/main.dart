import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/cart/cart_controller.dart';
import 'controller/navigation/navigation_controller.dart';
import 'utils/ui_helper.dart';
import 'views/root_gronik.dart';
import 'views/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());

  AppUiHelper.autoRotateOff();
  Get.put(NavigationController());
  Get.put(CartController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightGronikTheme,
      home: GronikRoot(),
    );
  }
}
