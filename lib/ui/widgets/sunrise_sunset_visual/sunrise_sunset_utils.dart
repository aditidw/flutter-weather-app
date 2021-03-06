import "dart:math";
import 'dart:ui';

class SizingAndLocation {
  // Sunrise sunset is a circle with bottom half clipped i.e semi circle
  // (minWidth, minHeight) = bottom left end of the semi-circle
  // semicircle lies between minHeight and maxHeight
  // minHeight = group plane height
  // maxHeight = zenith height
  // rectWidth = total width of the semicircle
  Size size;
  double minHeight = 0.0;
  double maxHeight = 0.0;
  double rectWidth = 0.0;
  double minWidth = 0.0;

  SizingAndLocation({required this.size}) {
    minHeight = (size.height * 0.7);
    maxHeight = size.height * 0.08;
    rectWidth = (minHeight - maxHeight) * 2.0;
    minWidth = (size.width - rectWidth) / 2;
  }

  Offset locateSunPosition(double coverPercent) {
    // (x,y) = (r * cos(theta), r * sin(theta))
    // sun rises from the left bottom end
    // sun sets in the right bottom end
    double theta = pi * coverPercent;
    double radius = rectWidth / 2;
    double originX = minWidth + radius;
    double originY = minHeight;
    double x = originX - radius * cos(theta);
    double y = originY - radius * sin(theta);
    return Offset(x, y);
  }

  Offset locateSunRisePoint() {
    return Offset(minWidth, minHeight);
  }

  Offset locateSunSetPoint() {
    return Offset(size.width - minWidth, minHeight);
  }
}