import 'package:flutter/material.dart';
import 'package:spotify/widgets/costum_image_view.dart';
import '../../core/app_export.dart';
import '../custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarLeadingIconbuttonTwo extends StatelessWidget {
  const AppbarLeadingIconbuttonTwo({
    Key? key,
    this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? imagePath;
  final Function? onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: CustomIconButton(
          height: height ?? 32.h,
          width: width ?? 32.h,
          padding: EdgeInsets.all(4.h),
          decoration: IconButtonStyleHelper.none,
          child: CustomImageView(
            imagePath: imagePath ?? ImageConstant.imgHiconBoldLeft, // Use provided imagePath or default
          ),
        ),
      ),
    );
  }
}
