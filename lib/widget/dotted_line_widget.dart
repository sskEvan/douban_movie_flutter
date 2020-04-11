import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int orientationHorizontal = 0;
const int orientationVertical = 1;

class DottledLine extends StatelessWidget{

  final double length;
  final double strokeWidth;
  final int orientation;
  final double spacing;
  final Color color;

  DottledLine({@required this.length, this.strokeWidth = 1,
    this.orientation = orientationHorizontal, this.spacing = 3, this.color = Colors.black38});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: orientation == orientationHorizontal
          ? Size(length, strokeWidth)
          : Size(strokeWidth, length),

      painter: DottledLinePainter(length, strokeWidth, orientation, spacing, color),
    );
  }
}

class DottledLinePainter extends CustomPainter {

  final double length;
  final double strokeWidth;
  final int orientation;
  final double spacing;
  final Color color;


  DottledLinePainter(this.length, this.strokeWidth, this.orientation,
      this.spacing, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..color = color;

    if(orientation == orientationHorizontal) {
      for(int i = 0; i <= length / spacing; i++) {
        if(i % 2 == 0) {
          canvas.drawLine(Offset(spacing * i, 0), Offset(spacing * (i + 1), 0), paint);
        }
      }
    }else {
      for(int i = 0; i <= length / spacing; i++) {
        if(i % 2 == 0) {
          canvas.drawLine(Offset(0, spacing * i), Offset(0, spacing * (i + 1)), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}