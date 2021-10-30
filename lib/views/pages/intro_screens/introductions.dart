/* <-----------------------> 
    This files contains all the INTRODUCTION SCREEENS
 <-----------------------> */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:gronik/constants/app_defaults.dart';
import 'package:gronik/constants/app_images.dart';
import 'package:gronik/constants/app_sizes.dart';
import 'package:gronik/services/intro_service.dart';
import 'package:gronik/views/pages/auth/sign_up.dart';
import 'package:gronik/constants/app_colors.dart';
import 'package:gronik/views/theme/text_theme.dart';

class IntroductionScreens extends StatefulWidget {
  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  /* <---- All of the intro pages ----> */
  List<_IntroPages> _introPages = [
    _IntroPages(
      headline: 'Shop your daily needs',
      slogan: 'You won’t find it cheaper anywhere else than Gronik.',
      introImage: AppImages.INTRO_1,
    ),
    _IntroPages(
      headline: 'Exiting offers',
      slogan: 'Get new offers and great deals evryday evry hour.',
      introImage: AppImages.INTRO_2,
    ),
    _IntroPages(
      headline: '1000+ products',
      slogan: 'Shop and get delivery at your convenience.',
      introImage: AppImages.INTRO_3,
    ),
  ];

  /// SKIP BUTTON ACTION
  _onSkip() {
    Get.to(() => SignUpScreen());
  }

  /// GET STARTED BUTTON ACTION
  _onGetStarted() {
    if (_currentPage.value == _introPages.length - 1) {
      IntroService.saveIntroHasBeeenViewed();
      Get.offAll(() => SignUpScreen());
    } else {
      _pageController.animateToPage(
        _currentPage.value + 1,
        duration: AppDefaults.defaultDuration,
        curve: Curves.easeIn,
      );
    }
  }

  /// Page Controller
  late PageController _pageController;

  /// CURRENT PAGE
  RxInt _currentPage = 0.obs;

  /* <---- State -----> */
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _currentPage.close();
    super.dispose();
  }

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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                          InkWell(
                            onTap: _onSkip,
                            child: Text(
                              'Skip',
                              style: AppText.paragraph1
                                  .copyWith(color: Colors.white),
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
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            /* <----------- Image Section ------------> */
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    /* <---- Intro Image ----> */
                                    Expanded(
                                      child: PageView.builder(
                                        itemCount: _introPages.length,
                                        controller: _pageController,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return _introPages[index];
                                        },
                                        onPageChanged: (index) {
                                          /* <---- This is located in Navigation controller ----> */
                                          _currentPage.value = index;
                                        },
                                      ),
                                    ),

                                    /* <---- Dots ----> */
                                    Obx(
                                      () => Container(
                                        margin: EdgeInsets.only(bottom: 30),
                                        width: Get.width * 0.1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _IntroDots(
                                              active: _currentPage.value == 0,
                                            ),
                                            _IntroDots(
                                              active: _currentPage.value == 1,
                                            ),
                                            _IntroDots(
                                              active: _currentPage.value == 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            /* <---- Get Started Button ----> */
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: _onGetStarted,
                                    child: Container(
                                      width: Get.width * 0.8,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      decoration: BoxDecoration(
                                        color: AppColors.PRIMARY_COLOR,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'Get Started',
                                        style: AppText.paragraph1
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  AppSizes.hGap10,
                                ],
                              ),
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
      ),
    );
  }
}

/* <---- Dots in the intro ----> */

class _IntroDots extends StatelessWidget {
  const _IntroDots({
    this.active = false,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: active ? 5 : 3,
      backgroundColor: active ? AppColors.PRIMARY_COLOR : Color(0xFFE7E7ED),
    );
  }
}

class _IntroPages extends StatelessWidget {
  const _IntroPages({
    required this.headline,
    required this.slogan,
    required this.introImage,
  });

  final String introImage;
  final String headline;
  final String slogan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.8,
                child: Image.asset(introImage),
              ),
              AppSizes.hGap40,
              /* <---- HeadLine ----> */
              Text(
                headline,
                style: AppText.heading1,
                textAlign: TextAlign.center,
              ),
              AppSizes.hGap15,
              Text(
                slogan,
                style: AppText.paragraph1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
