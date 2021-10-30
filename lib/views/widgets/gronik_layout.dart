/* <----------- Layout or Structure of UI ------------> */
/* <---- Layout 1 ----> */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gronik/constants/app_images.dart';
import 'package:gronik/constants/app_sizes.dart';
import 'package:gronik/views/theme/text_theme.dart';

class GronikLayoutOne extends StatelessWidget {
  const GronikLayoutOne({
    Key? key,
    required this.content,
    required this.bottomBar,
  });

  final Widget content;
  final Widget bottomBar;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth,
            ),
          ),
          /* <----------- Screens ------------> */
          SafeArea(
            bottom: false,
            child: Container(
              child: Column(
                children: [
                  /* <----- Appbar -----> */
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Row(
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
                      ],
                    ),
                  ),
                  AppSizes.hGap20,

                  /* <---- Main Container ----> */
                  Expanded(
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          content,
                          /* <---- Get Started Button ----> */
                          bottomBar,

                          /* <---- To avoid overriding navigation ----> */
                          Container(
                            height: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/* <---- Layout2 with appbar----> */
class GronikLayoutTwo extends StatelessWidget {
  const GronikLayoutTwo({
    Key? key,
    required this.content,
    required this.appBarTitle,
    this.bottomAppBar,
    this.backButtonFunction,
  });

  final Widget content;
  final void Function()? backButtonFunction;
  final String appBarTitle;
  final Widget? bottomAppBar;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Container(
              child: Column(
                children: [
                  /* <----- Appbar -----> */
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: backButtonFunction ??
                              () {
                                Get.back();
                              },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '$appBarTitle',
                          style: AppText.heading1.copyWith(color: Colors.white),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                  AppSizes.hGap20,

                  /* <---- Main Container ----> */
                  Expanded(
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F5F7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          /* <---- Rest of the content ----> */
                          content,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomAppBar ?? SizedBox(),
        ],
      ),
    );
  }
}
