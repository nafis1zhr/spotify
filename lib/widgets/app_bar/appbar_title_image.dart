import 'package:flutter/material.dart';
import 'package:spotify/widgets/costum_image_view.dart';
import '../../core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarTitleImage extends StatelessWidget {
  const AppbarTitleImage({
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
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: CustomImageView(
          imagePath: imagePath ?? ImageConstant.imgDefault, // Provide a default image path if needed
          height: height ?? 32.h,
          width: width ?? 108.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
