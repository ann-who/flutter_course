import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.sunOpacity,
    required this.cloudOpacity,
    required this.dropsOpacity,
    this.width,
    this.height,
  });

  final double sunOpacity;
  final double cloudOpacity;
  final double dropsOpacity;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var initWidth = MediaQuery.of(context).size.width;
    var initHeight = MediaQuery.of(context).size.height / 2;

    return Stack(
      children: [
        SizedBox(
          width: width ?? initWidth,
          height: height ?? initHeight,
          child: CustomPaint(
            painter: SunPainter(opacity: sunOpacity),
          ),
        ),
        SizedBox(
          width: width ?? initWidth,
          height: height ?? initHeight,
          child: CustomPaint(
            painter: CloudPainter(opacity: cloudOpacity),
          ),
        ),
        SizedBox(
          width: width ?? initWidth,
          height: height ?? initHeight,
          child: CustomPaint(
            painter: DropsPainter(opacity: dropsOpacity),
          ),
        ),
      ],
    );
  }
}

class SunPainter extends CustomPainter {
  final double opacity;

  SunPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    var sunPaint = Paint()
      ..color = const Color(0xFFffb703).withOpacity(opacity);

    canvas.drawCircle(
      Offset(width * 0.5, height * 0.5),
      height * 0.25,
      sunPaint,
    );
  }

  @override
  bool shouldRepaint(covariant SunPainter oldDelegate) {
    return oldDelegate.opacity != opacity;
  }
}

class CloudPainter extends CustomPainter {
  final double opacity;

  CloudPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    var cloudPaint = Paint()
      ..color =
          opacity > 0.2 ? Colors.grey.withOpacity(opacity) : Colors.transparent
      ..style = PaintingStyle.fill;

    var darkCloudPaint = Paint()
      ..color = const Color(0xFF463f3a).withOpacity(opacity)
      ..style = PaintingStyle.fill;

    var cloudPath = Path()
      ..fillType = PathFillType.nonZero
      ..moveTo(width * 0.1, height * 0.7)
      ..addOval(
        Rect.fromLTWH(width * 0.2, height * 0.67, width * 0.6, height * 0.12),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(width * 0.22, height * 0.61),
          radius: height * 0.16,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(width * 0.5, height * 0.55),
          radius: height * 0.22,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(width * 0.75, height * 0.6),
          radius: height * 0.18,
        ),
      )
      ..close();

    canvas.drawPath(cloudPath, cloudPaint);
    canvas.drawPath(cloudPath, darkCloudPaint);
  }

  @override
  bool shouldRepaint(covariant CloudPainter oldDelegate) {
    return oldDelegate.opacity != opacity;
  }
}

class DropsPainter extends CustomPainter {
  final double opacity;

  DropsPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    var dropPaint = Paint()
      ..color = const Color(0xFF023e8a).withOpacity(opacity)
      ..style = PaintingStyle.fill;

    Path firstDropPath = Path()
      ..moveTo(width * 0.2, height * 0.8)
      ..quadraticBezierTo(width * 0.23, height * 0.9, width * 0.2, height * 0.9)
      ..quadraticBezierTo(width * 0.14, height * 0.9, width * 0.2, height * 0.8)
      ..close();

    canvas.drawPath(firstDropPath, dropPaint);

    Path secondDropPath = Path()
      ..moveTo(width * 0.4, height * 0.8)
      ..quadraticBezierTo(width * 0.43, height * 0.9, width * 0.4, height * 0.9)
      ..quadraticBezierTo(width * 0.34, height * 0.9, width * 0.4, height * 0.8)
      ..close();

    canvas.drawPath(secondDropPath, dropPaint);

    Path thirdDropPath = Path()
      ..moveTo(width * 0.6, height * 0.8)
      ..quadraticBezierTo(width * 0.63, height * 0.9, width * 0.6, height * 0.9)
      ..quadraticBezierTo(width * 0.54, height * 0.9, width * 0.6, height * 0.8)
      ..close();

    canvas.drawPath(thirdDropPath, dropPaint);

    Path forthDropPath = Path()
      ..moveTo(width * 0.8, height * 0.8)
      ..quadraticBezierTo(width * 0.83, height * 0.9, width * 0.8, height * 0.9)
      ..quadraticBezierTo(width * 0.74, height * 0.9, width * 0.8, height * 0.8)
      ..close();

    canvas.drawPath(forthDropPath, dropPaint);
  }

  @override
  bool shouldRepaint(covariant DropsPainter oldDelegate) {
    return oldDelegate.opacity != opacity;
  }
}
