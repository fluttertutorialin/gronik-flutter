import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../views/widgets/categories_tile.dart';
import '../../views/pages/home_products/categories_details.dart';

class CategoriesController {
  /// FETCH CART FROM SERVICES
  static List<CategoriesTile> categories = [
    CategoriesTile(
      categoryName: 'Vegetables',
      imageLocation: AppImages.CATEGORY_VEGETABLES,
      onTap: () {
        // Go to categories details page
        Get.to(() => CategoriesDetails());
      },
    ),
    CategoriesTile(
      categoryName: 'Fruits',
      imageLocation: AppImages.CATEGORY_FRUITS,
      onTap: () {
        // Go to categories details page
        Get.to(() => CategoriesDetails());
      },
    ),
    CategoriesTile(
      categoryName: 'Meat',
      imageLocation: AppImages.CATEGORY_MEAT,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Milk and Egg',
      imageLocation: AppImages.CATEGORY_MILK_EGG,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Fish',
      imageLocation: AppImages.CATEGORY_FISH,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Drinks',
      imageLocation: AppImages.CATEGORY_DRINKS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Seafood',
      imageLocation: AppImages.CATEGORY_SEA_FOODS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Cake',
      imageLocation: AppImages.CATEGORY_CAKE,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Bakery',
      imageLocation: AppImages.CATEGORY_BAKERY,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Biscuits',
      imageLocation: AppImages.CATEGORY_BISCUITS,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Ice Cream',
      imageLocation: AppImages.CATEGORY_ICE_CREAM,
      onTap: null,
    ),
    CategoriesTile(
      categoryName: 'Juice',
      imageLocation: AppImages.CATEGORY_JUICE,
      onTap: null,
    ),
  ];
}
