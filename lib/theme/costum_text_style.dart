import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/widgets/custom_elevated_button.dart'; // Pastikan Anda mengimpor ini jika menggunakan flutter_screenutil
import 'package:spotify/widgets/custom_text_form_field.dart';

class CustomTextStyles {
  // Body text styles
  static TextStyle bodyMedium14(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 14.sp,
      );

  static TextStyle bodyMediumGray70001(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70001,
        fontSize: 14.sp,
      );

  static TextStyle bodyMediumGray80001(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: appTheme.gray80001,
        fontSize: 13.sp,
      );

  static TextStyle bodySmallGray60003(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        color: appTheme.gray60003,
      );

  static TextStyle bodySmallGray80003(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        color: appTheme.gray80003,
      );

  static TextStyle bodySmallGreen600(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        color: appTheme.green600,
      );

  static TextStyle bodySmallOnErrorContainer(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.onErrorContainer,
      );

  static TextStyle bodySmallOnPrimary(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      );

  // Label text styles
  static TextStyle labelLargeGray5001(BuildContext context) => Theme.of(context).textTheme.labelLarge!.copyWith(
        color: appTheme.gray5001,
        fontWeight: FontWeight.w500,
      );

  static TextStyle labelLargeGray80002(BuildContext context) => Theme.of(context).textTheme.labelLarge!.copyWith(
        color: appTheme.gray80002,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      );

  // Title text styles
  static TextStyle titleLargeBlack900(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleLargeBluegray10001(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray10001,
        fontSize: 22.sp,
      );

  static TextStyle titleLargeGray100(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        color: appTheme.gray100,
        fontSize: 22.sp,
      );

  static TextStyle titleLargeGray40001(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        color: appTheme.gray40001,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleLargeOnErrorContainer(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onErrorContainer,
      );

  static TextStyle titleMedium18(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 18.sp,
      );

  static TextStyle titleMediumBluegray10001(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray10001,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleMediumBluegray900(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 19.sp,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleMediumOnPrimary(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      );

  static TextStyle titleMediumOnPrimaryContainer(BuildContext context) => Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 19.sp,
        fontWeight: FontWeight.w500,
      );

  // Additional styles for title and body text
  static TextStyle titleSmallBlue600(BuildContext context) => Theme.of(context).textTheme.titleSmall!.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w700,
      );

  static TextStyle titleSmallOnPrimary(BuildContext context) => Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle titleSmallOnPrimaryContainer(BuildContext context) => Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      );

  static titleMediumGray80003(BuildContext context) {}

  // Add any additional styles you may need
}
