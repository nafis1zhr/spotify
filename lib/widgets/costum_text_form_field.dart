import 'package:flutter/material.dart';
import 'package:spotify/theme/costum_text_style.dart'; 
import 'package:spotify/theme/custom_text_style.dart';
import '../core/app_export.dart';
import 'package:spotify/theme/custom_button_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.scrollPadding, // Pastikan ini dideklarasikan dengan benar
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? scrollPadding; // Tambahkan tipe data untuk scrollPadding
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: TextFormField(
          scrollPadding: scrollPadding ?? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          style: textStyle ?? CustomTextStyles.titleMediumGray80003(context),
          obscureText: obscureText!,
          readOnly: readOnly!,
          onTap: () {
            onTap?.call();
          },
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration(context),
          validator: validator,
        ),
      );

  InputDecoration decoration(BuildContext context) => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.titleMediumGray80003(context),
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 26.h, vertical: 28.h),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.black900.withOpacity(0.2),
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.black900.withOpacity(0.2),
                width: 1,
              ),
            ),
        focusedBorder: (borderDecoration ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.h),
                ))
            .copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
      );
}
