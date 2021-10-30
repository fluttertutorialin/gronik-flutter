import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categories.dart';
import 'search.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/dummyData.dart';
import '../../../controller/categories/categories_controller.dart';
import '../profile/profile.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

// Main Content of the home screen
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /* <----- Appbar -----> */
          Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      width: Get.width * 0.7,
                      child: Text(
                        'Hey 😊 \nLet\'s search your grocery food.',
                        style: AppText.paragraph1.copyWith(color: Colors.white),
                      ),
                    )),
                    InkWell(
                      onTap: () {
                        // Go to profile screen
                        Get.to(() => ProfileScreen());
                      },
                      child: Container(
                        child: Hero(
                          tag: 'profile',
                          child: CircleAvatar(
                            backgroundImage: AssetImage(AppImages.PROFILE_USER),
                            radius: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.NEUTRAL_50,
                        ),
                        AppSizes.wGap10,
                        Text(
                          'Search grocery food',
                          style: AppText.placeholder1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          AppSizes.hGap20,
          Expanded(
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories',
                                style: AppText.heading2,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => AllCategories());
                                },
                                child: Text(
                                  'See all',
                                  style: AppText.paragraph1
                                      .copyWith(color: AppColors.PRIMARY_COLOR),
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          AppSizes.hGap10,
                          Container(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoriesController.categories[index];
                              },
                              itemCount: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: Get.height * 0.18,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: DummyData.banners.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image(
                              image: DummyData.banners[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Popular Deals',
                                style: AppText.heading2,
                              ),
                              Text(
                                'See all',
                                style: AppText.paragraph1
                                    .copyWith(color: AppColors.PRIMARY_COLOR),
                              )
                            ],
                          ),
                          Divider(),
                          AppSizes.hGap10,
                          /* <---- All the deals ----> */
                          Container(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: DummyData.deals.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 120,
                                  child: Image(
                                    image: DummyData.deals[index],
                                  ),
                                );
                              },
                            ),
                          ),
                          AppSizes.hGap40,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
