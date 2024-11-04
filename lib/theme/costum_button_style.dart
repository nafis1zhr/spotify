import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style dengan parameter context
  static ButtonStyle fillPrimary(BuildContext context) => ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.h),
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    side: MaterialStateProperty.all(BorderSide(color: Colors.transparent)),
  );
}
