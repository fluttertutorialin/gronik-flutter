import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/dummyData.dart';
import 'product_details.dart';

import 'categories_details.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            /* <----------- Background Image ------------> */
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFF29AF61).withOpacity(0.8),
              ),
              child: Image.asset(
                AppImages.GRONIK_BACKGROUND,
                color: Colors.white,
                fit: BoxFit.fitWidth,
              ),
            ),
            /* <----------- Screens ------------> */
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  /* <----- Appbar -----> */
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Search',
                              style: AppText.heading1
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(),
                          ],
                        ),
                        /* <---- Search Box ----> */
                        AppSizes.hGap30,
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.NEUTRAL_50,
                            ),
                            hintText: 'Apple',
                            labelText: 'Search your daily grocery food...',
                          ),
                        )
                      ],
                    ),
                  ),
                  AppSizes.hGap20,

                  /* <---- Main Container ----> */
                  Expanded(
                    child: _ResultView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  const _ResultView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xFFF4F5F7),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(32)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* <---- Content ----> */
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* <---- Filter By ----> */
                  Row(
                    children: [
                      Text(
                        'Filter by',
                        style: AppText.paragraph1.copyWith(
                          color: AppColors.NEUTRAL_50,
                        ),
                      ),
                      AppSizes.wGap10,
                      DropdownButton<String>(
                        underline: SizedBox(),
                        value: 'low',
                        items: [
                          DropdownMenuItem(
                            value: 'low',
                            child: Text('Lowest Price'),
                          ),
                          DropdownMenuItem(
                            value: 'high',
                            child: Text('Highest Price'),
                          )
                        ],
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  /* <---- Total Results ----> */
                  Text(
                    '345 Results',
                    style: AppText.paragraph1.copyWith(
                      color: AppColors.NEUTRAL_50,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemBuilder: (context, index) {
                  return SingleProduct(
                    onTap: () {
                      Get.to(() => ProductDetails(
                            food: DummyData.foods[index],
                          ));
                    },
                    food: DummyData.foods[index],
                  );
                },
                staggeredTileBuilder: (ti) => StaggeredTile.fit(2),
                itemCount: DummyData.foods.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
