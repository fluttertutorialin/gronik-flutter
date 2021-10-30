import 'package:flutter/material.dart';
import '../services/intro_service.dart';
import '../utils/ui_helper.dart';
import 'pages/intro_screens/introductions.dart';
import 'pages/home_products/entrypoint.dart';

class GronikRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AppUiHelper.dismissKeyboard(context: context);
      },
      child:
          IntroService.isIntroDone() ? AppEntryPoint() : IntroductionScreens(),
    );
  }
}
