/* <---- This is responsible for all the banner in the app ----> */
import 'package:flutter/material.dart';
import 'package:gronik/constants/app_images.dart';
import 'package:gronik/modal/food.dart';

class DummyData {
  /* <---- Home Page Banner ----> */
  static List<AssetImage> banners = [
    AssetImage(AppImages.BANNER_IMAGE_1),
    AssetImage(AppImages.BANNER_IMAGE_2),
  ];

  /* <---- Home Page Deals ----> */
  static List<AssetImage> deals = [
    AssetImage(AppImages.DEALS_IMAGE_1),
    AssetImage(AppImages.DEALS_IMAGE_2),
    AssetImage(AppImages.DEALS_IMAGE_1),
  ];

  /* <---- Fruits Categories ----> */
  static List<Food> foods = [
    /* <---- Calculated In dollars ----> */
    Food(
      foodImage: AppImages.FRUIT_STRAWBERRY,
      foodName: 'Strawberry (1 Kg)',
      foodPrice: '20.00',
      foodWeight: '17.20',
    ),
    Food(
      foodImage: AppImages.FRUIT_ORANGE,
      foodName: 'Orange (10 pcs)',
      foodPrice: '10.00',
      foodWeight: '1/pcs',
    ),
    Food(
      foodImage: AppImages.FRUIT_BANANA,
      foodName: 'Banana (8 Pcs)',
      foodPrice: '1.60',
      foodWeight: '0.20/Pcs',
    ),
    Food(
      foodImage: AppImages.FRUIT_WATERMELON,
      foodName: 'Watermelon (1 Kg)',
      foodPrice: '4.25',
      foodWeight: '4.20/ 1Kg',
    ),
    Food(
      foodImage: AppImages.FRUIT_APPLE,
      foodName: 'Apple (1 Kg)',
      foodPrice: '20.00',
      foodWeight: '17.20',
    ),
    Food(
      foodImage: AppImages.FRUIT_APPLE,
      foodName: 'Apple (1 Kg)',
      foodPrice: '20.00',
      foodWeight: '17.20',
    ),
  ];

  static List<Food> cartItems = [];
}
