import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_weather_app/ui/constants/colors.dart';
import 'package:flutter_weather_app/ui/widgets/sunrise_sunset_visual/sunrise_sunset_utils.dart';

import 'sunrise_sunset_painter.dart';

class SunriseSunset extends StatelessWidget {
  final double coverPercent;
  final String sunRise;
  final String sunSet;

  SunriseSunset({required this.coverPercent, required this.sunRise, required this.sunSet});

  List<Widget> _buildLabels({required Offset sunRisePoint, required Offset sunSetPoint}) {
    return [
      Positioned(
          top: sunRisePoint.dy + 8.0,
          left: sunRisePoint.dx - 26.0,
          child: Text(
            sunRise,
            style: TextStyle(
              color: CustomColors.gray,
              fontWeight: FontWeight.w500,
            ),
          )),
      Positioned(
          top: sunSetPoint.dy + 8.0,
          left: sunSetPoint.dx - 26.0,
          child: Text(
            sunSet,
            style: TextStyle(
              color: CustomColors.gray,
              fontWeight: FontWeight.w500,
            ),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: CustomPaint(
        painter: SunriseSunsetPainter(coverPercent: coverPercent),
        child: LayoutBuilder(
          builder: (context, constraints) {
            SizingAndLocation sizingAndLoc = SizingAndLocation(
                size: Size(constraints.maxWidth, constraints.maxHeight));
            Offset sunLocation = sizingAndLoc.locateSunPosition(coverPercent);
            return Stack(
              children: [
                Positioned(
                  left: sunLocation.dx - 16.0,
                  top: sunLocation.dy - 16.0,
                  child: Icon(
                    CupertinoIcons.sun_max_fill,
                    color: CustomColors.red,
                    size: 32.0,
                  ),
                ),
                ..._buildLabels(
                    sunRisePoint: sizingAndLoc.locateSunRisePoint(),
                    sunSetPoint: sizingAndLoc.locateSunSetPoint()),
              ],
            );
          },
        ),
      ),
    );
  }
}