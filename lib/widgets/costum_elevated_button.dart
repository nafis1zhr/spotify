import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/theme/costum_text_style.dart';
import 'package:spotify/theme/custom_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final VoidCallback? onPressed;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool isDisabled;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.buttonStyle,
    this.buttonTextStyle,
    this.onPressed,
    this.alignment,
    this.margin,
    this.leftIcon,
    this.rightIcon,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = Container(
      height: height ?? 72.h,
      width: width ?? double.infinity,
      margin: margin,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: isDisabled ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            if (leftIcon != null) const SizedBox(width: 8),
            Text(
              text,
              style: buttonTextStyle ?? CustomTextStyles.titleLargeGray100(context),
            ),
            if (rightIcon != null) const SizedBox(width: 8),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
    return alignment != null ? Align(alignment: alignment!, child: button) : button;
  }
}
