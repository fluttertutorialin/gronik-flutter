import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../controller/cart/cart_controller.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/dummyData.dart';
import '../../../modal/food.dart';
import 'product_details.dart';
import '../../../constants/app_colors.dart';
import '../../theme/text_theme.dart';

class CategoriesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Fruits',
        content: Expanded(
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
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
                        foodIndex: index,
                      );
                    },
                    staggeredTileBuilder: (ti) => StaggeredTile.fit(2),
                    itemCount: DummyData.foods.length,
                  ),
                ),
                AppSizes.hGap40,
                AppSizes.hGap40,
              ],
            ),
          ),
        )
      ),
    );
  }
}

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    Key? key,
    required this.food,
    this.onTap,
    this.foodIndex,
  });

  final Food food;
  final void Function()? onTap;
  final int? foodIndex;

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct>
    with SingleTickerProviderStateMixin {
  bool isItExpanded = false;

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: Get.width * 0.45,
        // You can add this height if you want fixed layout
        // height: Get.height * 0.31,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFF4F5F7),
            width: 0.5,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    '${widget.food.foodImage}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.food.foodName}',
                              style: AppText.paragraph1.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            AppSizes.hGap5,
                            Text(
                              '\$${widget.food.foodWeight}',
                              style: AppText.paragraph1
                                  .copyWith(color: AppColors.NEUTRAL_50),
                            ),
                            AppSizes.hGap10,
                            Text(
                              '\$${widget.food.foodPrice}',
                              style: AppText.paragraph1.copyWith(
                                  color: AppColors.PRIMARY_COLOR,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* <---- Counter ----> */
                    // This will make sure the counter has enought space
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
            /* <---- Counter ----> */
            Positioned(
              bottom: 0,
              right: 0,
              child: AnimatedSize(
                duration: Duration(milliseconds: 300),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  child: isItExpanded
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /* <---- Increase quantity ----> */
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            AppSizes.hGap5,
                            Text(
                              '$quantity',
                              style: AppText.paragraph1
                                  .copyWith(fontSize: 14, color: Colors.white),
                            ),
                            AppSizes.hGap5,
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (quantity <= 1) {
                                  } else
                                    quantity--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : InkWell(
                          // Open the quantity menu
                          onLongPress: () {
                            setState(() {
                              isItExpanded = true;
                            });
                          },
                          // Add to cart
                          onTap: () {
                            DummyData.cartItems.add(
                              DummyData.foods[widget.foodIndex!],
                            );
                            Get.find<CartController>().cartItemsLength.value++;
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
