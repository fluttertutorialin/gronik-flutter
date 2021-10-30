import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

/// To Make a clean look at code. These are all theme specific style
class AppText {
  // For easy access on the code

  static TextStyle get b1 => Get.theme.textTheme.bodyText1!;
  static TextStyle get b2 => Get.textTheme.bodyText2!;

  static TextStyle get h1 => Get.textTheme.headline1!;
  static TextStyle get h2 => Get.textTheme.headline2!;
  static TextStyle get h3 => Get.textTheme.headline3!;
  static TextStyle get h4 => Get.textTheme.headline4!;
  static TextStyle get h5 => Get.textTheme.headline5!;
  static TextStyle get h6 => Get.textTheme.headline6!;

  static TextStyle get caption => Get.textTheme.caption!;
  static TextStyle get subtitle1 => Get.textTheme.subtitle1!;
  static TextStyle get subtitle2 => Get.textTheme.subtitle2!;

  /// THESE ARE CUSTOM STYLES FROM THE FIGMA FILE
  /// THE ABOVE ARE PREDEFINED BY THE FLUTTER TEAM
  static TextStyle heading1 = TextStyle(
      fontSize: 24, color: Color(0xFF2F3137), fontWeight: FontWeight.bold);

  static TextStyle heading2 = TextStyle(
      fontSize: 18, color: Color(0xFF2F3137), fontWeight: FontWeight.bold);

  static TextStyle placeholder1 = TextStyle(
    fontSize: 15,
    color: Colors.black38,
  );
  static TextStyle paragraph1 = TextStyle(
    fontSize: 16,
    color: Color(0xFF2F3137),
    fontWeight: FontWeight.w400,
  );
}
