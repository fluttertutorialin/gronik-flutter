import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/text_field_custom.dart';
import '../../widgets/gronik_layout.dart';
import '../../theme/text_theme.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'Contact Us',
        content: Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Stack(
                    children: [
                      Image.asset(AppImages.GRONIK_LOGO),
                      // Active or not
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  title: Text(
                    'Gronik',
                    style: AppText.paragraph1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.PRIMARY_COLOR,
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Assist by: ',
                          style: AppText.paragraph1.copyWith(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        TextSpan(
                          text: 'Lakhani kamlesh',
                          style: AppText.paragraph1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /* <---- Head Title ----> */
                        Container(
                          margin: EdgeInsets.all(16),
                          child: Text(
                            'Hi, can we help you? We will always help you to find your product 😊',
                            style: AppText.paragraph1.copyWith(
                              color: AppColors.APP_BLACK,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            UserMessageWidget(
                              userMessage:
                                  'Hello Gronik, I want to my order status #GR4567568 from your side.',
                            ),
                            AssistMessageWidget(
                              assistMessage:
                                  'Hello Mahmud, Nice to meet you here. You can check here: gr.nik/gr568',
                            ),
                            UserMessageWidget(
                              userMessage:
                                  'Hello Gronik, I want to my order status #GR4567568 from your side.',
                            ),
                            AssistMessageWidget(
                              assistMessage:
                                  'Hello Lakhani, Nice to meet you here. You can check here: gr.nik/gr568',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GronikTextField(
                          hintText: 'Type your message....',
                          labelText: '',
                          textEditingController: null,
                          marginLabelDisable: true,
                        ),
                      ),
                      AppSizes.wGap10,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: Image.asset(
                            AppImages.ICON_SEND,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomAppBar: SizedBox(),
      ),
    );
  }
}

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({
    Key? key,
    required this.userMessage,
  });

  final String userMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8.5),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$userMessage',
                      style: AppText.paragraph1.copyWith(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CustomPaint(
                          painter: MessagePointerUser(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSizes.wGap5,
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.PROFILE_USER),
          ),
        ],
      ),
    );
  }
}

class AssistMessageWidget extends StatelessWidget {
  const AssistMessageWidget({
    Key? key,
    required this.assistMessage,
  });

  final String assistMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.GRONIK_LOGO),
          ),
          AppSizes.wGap5,
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8.5),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$assistMessage',
                      style: AppText.paragraph1.copyWith(
                        height: 1.5,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: CustomPaint(
                          painter: MessagePointerAssist(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessagePointerUser extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = AppColors.PRIMARY_COLOR
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.54, 0);
    path_0.quadraticBezierTo(
        size.width * 0.17, size.height * 0.27, 0, size.height * 0.36);
    path_0.cubicTo(size.width * 0.00, size.height * 0.66, size.width * 0.01,
        size.height * 1.02, size.width, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.51, size.height * 0.66, size.width * 0.62, 0);

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MessagePointerAssist extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = AppColors.BACKGROUND_COLOR
      ..style = PaintingStyle.fill;

    Path path_0 = Path();

    path_0.quadraticBezierTo(
        size.width * 0.90, size.height * 0.28, size.width, size.height * 0.38);
    path_0.cubicTo(size.width * 1.00, size.height * 0.82, size.width * 0.82,
        size.height * 1.00, 0, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.43, size.height * 0.80, size.width * 0.60, 0);
    path_0.lineTo(size.width * 0.60, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
