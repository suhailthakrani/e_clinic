import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomInfoView extends StatelessWidget {
  final String title;
  final String value;
  final double height;
  final int flex;

  const CustomInfoView({
    Key? key,
    required this.title,
    required this.value,
    this.flex = 1,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: kGreyColor,
          strokeWidth: 1,
          dashWidth: 5,
          dashSpace: 0.5,
        ),
        child: Container(
          height: height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: kFieldGreyColor.withAlpha(40),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                // flex: 1,
                child: Text(
                  "$title :",
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 18,
                    color: kBlackColor.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                // flex: 2,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width - 16) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height - 0.5),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
