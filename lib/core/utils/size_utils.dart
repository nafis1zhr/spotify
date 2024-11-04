import 'package:flutter/material.dart';

// These are the Viewport values of Figma design
const num FIGMA_DESIGN_WIDTH = 390;
const num FIGMA_DESIGN_HEIGHT = 844;
const num FIGMA_DESIGN_STATUS_BAR = 0;

// Utility Class for Size Management
class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  static void setScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxHeight.isNonZero();
    } else {
      width = boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile; // Set default device type
  }
}

// Extension for Responsive Design
extension ResponsiveExtension on num {
  double get width => SizeUtils.width; // Mengakses width dari SizeUtils
 double get responsiveHeight => ((this * SizeUtils.height) / FIGMA_DESIGN_HEIGHT);// Menghitung tinggi responsif
  double get fSize => ((this * SizeUtils.width) / FIGMA_DESIGN_WIDTH); // Menghitung ukuran font responsif
}

// Extension for Double Formatting
extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits)); // Format menjadi double
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble(); // Mengembalikan nilai default jika nol
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}
