import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/navigation/navigation_controller.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/dummyData.dart';

import 'discount_page.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GronikLayoutTwo(
      appBarTitle: 'Offer',
      backButtonFunction: () {
        Get.find<NavigationController>().getBackPrevScreen();
      },
      /* <---- Content ----> */
      content: Expanded(
        child: Column(
          children: [
            /* <---- List of offers ----> */
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                width: Get.width * 0.9,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => DiscountPage());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: Get.height * 0.17,
                        child: Image(
                          image: DummyData.banners[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Do Nothing
      bottomAppBar: SizedBox(),
    );
  }
}
