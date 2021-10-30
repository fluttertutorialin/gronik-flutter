import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

//Bottom App Bar custom paint
class CustomBottomBarPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = AppColors.PRIMARY_COLOR
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.quadraticBezierTo(size.width * -0.02, size.height * 0.23,
        size.width * 0.07, size.height * 0.20);
    path_0.cubicTo(size.width * 0.18, size.height * 0.16, size.width * 0.28,
        size.height * 0.12, size.width * 0.38, size.height * 0.10);
    path_0.cubicTo(size.width * 0.42, size.height * 0.10, size.width * 0.38,
        size.height * 0.60, size.width * 0.50, size.height * 0.60);
    path_0.cubicTo(size.width * 0.62, size.height * 0.60, size.width * 0.57,
        size.height * 0.10, size.width * 0.63, size.height * 0.10);
    path_0.cubicTo(size.width * 0.72, size.height * 0.12, size.width * 0.82,
        size.height * 0.15, size.width * 0.93, size.height * 0.20);
    path_0.quadraticBezierTo(
        size.width * 1.03, size.height * 0.24, size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ReviewsCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = AppColors.PRIMARY_COLOR
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(
        size.width * 0.31, size.height * 0.00, size.width * 0.38, 0);
    path_0.cubicTo(size.width * 0.43, size.height * 0.00, size.width * 0.43,
        size.height * 0.07, size.width * 0.50, size.height * 0.07);
    path_0.cubicTo(size.width * 0.56, size.height * 0.07, size.width * 0.57,
        size.height * -0.00, size.width * 0.63, 0);
    path_0.quadraticBezierTo(
        size.width * 0.75, size.height * 0.00, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    /* <---- Circle ----> */
    Paint circle = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.50, 5), 5, circle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Details tab
class DetailsCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = AppColors.PRIMARY_COLOR
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(
        size.width * 0.04, size.height * 0.00, size.width * 0.10, 0);
    path_0.cubicTo(size.width * 0.16, size.height * 0.00, size.width * 0.17,
        size.height * 0.07, size.width * 0.23, size.height * 0.07);
    path_0.cubicTo(size.width * 0.28, size.height * 0.07, size.width * 0.30,
        size.height * -0.00, size.width * 0.35, 0);
    path_0.quadraticBezierTo(
        size.width * 0.48, size.height * -0.00, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    /* <---- Circle ----> */
    Paint circle = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.23, 5), 5, circle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Custom Cart Counter
class CustomCartCounter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.75, 0, size.width, 0);
    path_0.quadraticBezierTo(size.width * 1.01, size.height * 0.50,
        size.width * 0.96, size.height * 0.67);
    path_0.cubicTo(size.width * 0.94, size.height * 0.76, size.width * 0.60,
        size.height * 0.88, size.width * 0.60, size.height * 0.94);
    path_0.cubicTo(size.width * 0.60, size.height * 1.00, size.width * 0.57,
        size.height * 0.99, size.width * 0.51, size.height * 1.00);
    path_0.cubicTo(size.width * 0.45, size.height * 0.99, size.width * 0.40,
        size.height * 1.01, size.width * 0.40, size.height * 0.94);
    path_0.cubicTo(size.width * 0.40, size.height * 0.88, size.width * 0.06,
        size.height * 0.76, size.width * 0.04, size.height * 0.67);
    path_0.cubicTo(
        size.width * 0.01, size.height * 0.50, 0, size.height * 0.50, 0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
