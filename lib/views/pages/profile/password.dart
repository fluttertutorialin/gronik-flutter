import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../../widgets/buttons.dart';

class PasswordChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Password',
        content: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GronikTextField(
                          labelText: 'Old Password',
                          textEditingController: null,
                          isItPassWordBox: true,
                        ),
                        GronikTextField(
                          labelText: 'New Password',
                          textEditingController: null,
                          isItPassWordBox: true,
                        ),
                        GronikTextField(
                          labelText: 'Confirm Password',
                          textEditingController: null,
                          isItPassWordBox: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: AppButton(
                  label: 'Save Changes',
                  onTap: null,
                ),
              ),
            ],
          ),
        ),
        bottomAppBar: SizedBox(),
      ),
    );
  }
}
