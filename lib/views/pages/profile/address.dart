import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dialogs/add_address_sheet.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../../constants/app_colors.dart';
import '../../widgets/buttons.dart';
import '../../theme/text_theme.dart';

class AddressList extends StatefulWidget {
  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  bool showSavedAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GronikLayoutTwo(
          appBarTitle: 'Delivery Address',
          /* <---- Content ----> */
          content: Expanded(
            child: Container(
              child: Column(
                children: [
                  showSavedAddress
                      ?
                      /* <---- list of address ----> */
                      SavedAddressList()
                      :
                      /* <---- When there is no address ----> */
                      NoAddressAvailable(),

                  /* <---- Add a card ----> */
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        )),
                    child: AppButton(
                      label: 'Add address',
                      onTap: () async {
                        showSavedAddress = await Get.bottomSheet(
                              AddAddressSheet(),
                              isScrollControlled: true,
                              clipBehavior: Clip.none,
                            ) ??
                            false;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          /* <---- Bottom Bar ----> */
          bottomAppBar: SizedBox(),
        ),
      ),
    );
  }
}

class SavedAddressList extends StatelessWidget {
  const SavedAddressList({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            AppSizes.hGap15,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                title: Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    '1002  Trouser Leg Road, Greenfield, Massachusetts, 01301'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                title: Text(
                  'Work',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('530  Juniper Drive, Saginaw, Michigan, 48603'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* <---- When there is no payment saved ----> */
class NoAddressAvailable extends StatelessWidget {
  const NoAddressAvailable({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.6,
              child: Image.asset(AppImages.PAY_NO_ADDRESS),
            ),
            AppSizes.hGap10,
            Text(
              'No Address',
              style: AppText.heading1.copyWith(
                color: AppColors.NEUTRAL_800,
                fontSize: 32,
              ),
            ),
            AppSizes.hGap10,
            Text(
              'It looks like you do not have any delivery address yet.',
              style: AppText.paragraph1.copyWith(
                color: AppColors.APP_BLACK,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
