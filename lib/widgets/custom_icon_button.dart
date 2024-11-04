import 'package:flutter/material.dart';
import '../../core/app_export.dart'; // Fixed import path
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300,
        borderRadius: BorderRadius.circular(14.h),
      );

  static BoxDecoration get fillGrayTL18 => BoxDecoration(
        color: appTheme.gray300,
        borderRadius: BorderRadius.circular(18.h),
      );

  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(36.h), // Moved to correct position
      );

  static BoxDecoration get fillBlackTL16 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.13),
        borderRadius: BorderRadius.circular(16.h),
      );

  static BoxDecoration get fillPrimaryTL24 => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(24.h),
      );

  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16.h),
      );

  static BoxDecoration get none => BoxDecoration();
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  }) : super(key: key);

  final Alignment? alignment;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: DecoratedBox(
          decoration: decoration ??
              BoxDecoration(
                color: appTheme.black900.withOpacity(0.04),
                borderRadius: BorderRadius.circular(16.h),
              ),
          child: IconButton(
            padding: padding ?? EdgeInsets.zero,
            onPressed: onTap,
            icon: child ?? Container(),
          ),
        ),
      );
}
