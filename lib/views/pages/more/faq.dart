import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widgets/gronik_layout.dart';
import '../../theme/text_theme.dart';

class FaqScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GronikLayoutTwo(
        appBarTitle: 'FAQs',
        /* <---- Content ----> */
        content: Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSizes.hGap10,
                  QuestionAndAnswer(
                    question:
                        'How do I order grocery from this mobile application?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question: 'Are the prices different than at the shop?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question: 'What if the restaurant has changed its prices?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question: 'When are you getting more shop as partners?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question:
                        'How can I put special requests on my online order?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question:
                        'Who do I call if there is a mistake with my order?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                  QuestionAndAnswer(
                    question:
                        'Who do I call if there is a mistake with my order?',
                    answer:
                        'You can pay with a credit card or via net banking (if you’re in United States). We will renew your subscription automatically at the end of every billing cycle.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({
    Key? key,
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  _QuestionAndAnswerState createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  bool isContainerExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isContainerExpanded = !isContainerExpanded;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.question}',
                      style: AppText.paragraph1.copyWith(
                        color: AppColors.APP_BLACK,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.APP_BLACK),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isContainerExpanded ? Icons.remove : Icons.add,
                    ),
                  ),
                ],
              ),
              isContainerExpanded
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              '${widget.answer}',
                              style: AppText.paragraph1.copyWith(
                                color: Color(0xFF5A7184),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
