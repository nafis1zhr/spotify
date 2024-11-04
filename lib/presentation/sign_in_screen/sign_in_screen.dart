import 'package:flutter/material.dart';
import 'package:spotify/theme/costum_button_style.dart';
import 'package:spotify/theme/costum_text_style.dart';
import 'package:spotify/widgets/costum_elevated_button.dart';
import 'package:spotify/widgets/costum_image_view.dart';
import 'package:spotify/widgets/costum_text_form_field.dart';
import '../../core/app_export.dart';
import 'package:spotify/theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_two.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore_for_file: must_be_immutable

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray10001,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(26.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in",
                  style: theme.textTheme.headlineLarge,
                ),
                SizedBox(height: 22.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "If you need any support, ",
                        style: CustomTextStyles.bodySmallGray80003,
                      ),
                      TextSpan(
                        text: "click here",
                        style: CustomTextStyles.bodySmallGreen600,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  controller: userNameController,
                  obscureText: false,
                  contentPadding: EdgeInsets.all(26.h),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  controller: passwordController,
                  obscureText: true,
                  contentPadding: EdgeInsets.all(26.h),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: Text(
                      "Recovery password",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                CustomElevatedButton(
                  height: 80.h,
                  text: "Sign In",
                  margin: EdgeInsets.only(left: 6.h, right: 4.h),
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainer,
                ),
                SizedBox(height: 20.h),
                _buildDividerRow(context),
                SizedBox(height: 34.h),
                SizedBox(
                  width: 116.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGoogle,
                        height: 28.h,
                        width: 28.h,
                        alignment: Alignment.bottomCenter,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgVector,
                        height: 36.h,
                        width: 30.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 56.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "not a member?",
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Divider(),
            ),
          ),
          SizedBox(width: 10.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              "or",
              style: CustomTextStyles.bodySmallGray80003,
            ),
          ),
          SizedBox(width: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
