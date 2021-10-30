import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_images.dart';
import '../../controller/cart/cart_controller.dart';
import '../../constants/app_colors.dart';
import 'custom_paint.dart';
import '../theme/text_theme.dart';

class CartButton extends StatefulWidget {
  final void Function() onTap;
  const CartButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> with TickerProviderStateMixin {
  late AnimationController animationController;

  // Cart Animation
  _checkCartAnimation() {
    Get.find<CartController>().cartItemsLength.listen((onData) {
      animationController.forward();
    });
  }

  late Animation<double> normalMargin;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _checkCartAnimation();
    normalMargin = Tween(begin: 10.00, end: 25.00)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
            animation: normalMargin,
            builder: (context, child) {
              return Container(
                child: Container(
                  margin: EdgeInsets.only(top: normalMargin.value),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border:
                        Border.all(width: 6, color: AppColors.PRIMARY_COLOR),
                  ),
                  width: Get.width,
                  child: InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(AppImages.MENU_CART),
                    ),
                  ),
                ),
              );
            }),

        /* <---- Counter ----> */
        /* <---- For counting the cart item ----> */
        /* <---- If the count is 0 we will not show anything ----> */

        Obx(
          () => Get.find<CartController>().cartItemsLength.value == 0
              ? SizedBox()
              : Positioned(
                  top: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CustomPaint(
                      painter: CustomCartCounter(),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 10, left: 8, right: 8),
                        child: Text(
                          '${Get.find<CartController>().cartItemsLength.value}',
                          style: AppText.paragraph1.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
