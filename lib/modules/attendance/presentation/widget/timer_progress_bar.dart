import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/daily_log/daily_log.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'dart:math' as math;

import 'package:pay_day_mobile/utils/app_layout.dart';

class TimerProgressBar extends StatefulWidget {
  final double? lowerBound;

  const TimerProgressBar({super.key, this.lowerBound});

  @override
  State<TimerProgressBar> createState() => _TimerProgressBarState();
}

class _TimerProgressBarState extends State<TimerProgressBar>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AttendanceController controller;
  late Data? data;

  @override
  void initState() {
    super.initState();
    controller = Get.find<AttendanceController>();
    data = controller.logs.value.data;
    AnimationController animationController = AnimationController(
        // timer value will be set here
        lowerBound: widget.lowerBound ?? 0,
        upperBound: 1,
        vsync: this);
    final curveAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);
    animation = Tween<double>(begin: 0.0, end: 3.14).animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    print("animation.value ${animation.value}, ${controller.duration.value}");
    return SizedBox(
      height: AppLayout.getHeight(100),
      width: AppLayout.getWidth(160),
      child: Stack(
        children: [
          CustomPaint(
            painter:
                ProgressArc(arc: null, progressColor: AppColor.primary_blue),
          ),
          CustomPaint(
            painter:
                ProgressArc(arc: animation.value, progressColor: Colors.white),
          )
        ],
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

double getWorkPercentage(AttendanceController controller, data) {
  double value = controller.isPunchIn.isFalse
      ? data.todayWorked.toDouble() / data.todayScheduled.toDouble()
      : (controller.duration.value.inMinutes / 60);
  if (value >= 1) {
    return value = 1.00;
  }
  print(value);
  return value;
}

class ProgressArc extends CustomPainter {
  final double? arc;
  final Color progressColor;

  ProgressArc({required this.arc, required this.progressColor});

  @override
  void paint(Canvas canvas, Size size) {
    var rect =
        Rect.fromLTRB(0, 0, AppLayout.getWidth(160), AppLayout.getHeight(160));
    const startAngle = -math.pi;
    final sweepAngle = arc ?? math.pi;
    const useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.square
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
