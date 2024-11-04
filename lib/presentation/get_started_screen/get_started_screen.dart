import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify/theme/costum_button_style.dart';
import 'package:spotify/theme/costum_text_style.dart';
import 'package:spotify/theme/custom_button_style.dart';
import 'package:spotify/theme/custom_text_style.dart';
import 'package:spotify/widgets/costum_elevated_button.dart';
import 'package:spotify/widgets/custom_elevated_button.dart';

class RegisterSignInScreen extends StatelessWidget {
  const RegisterSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              height: 1046.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildBackgroundImage(context),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 42.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLogoAndRegisterRow(context),
                          SizedBox(height: 54.h),
                          Text(
                            "Enjoy listening to music",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            "Spotify is a proprietary Swedish audio streaming",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 72.h),
                          Image.asset(
                            'assets/images/ruwet1.png',
                            height: 568.h,
                            width: 250.w,
                            alignment: Alignment.centerRight,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    return Container(
      height: 432.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/bule2.jpg',
            height: 432.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          _buildLogoAndRegisterRow(context),
        ],
      ),
    );
  }

  Widget _buildLogoAndRegisterRow(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 22.h, left: 30.w, right: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(context),
            Row(
              children: [
                CustomElevatedButton(
                  height: 72.h,
                  width: 146.w,
                  text: "Register",
                  buttonStyle: CustomButtonStyles.none,
                  buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer(context),
                  onPressed: () {
                    // Logic untuk Register
                  },
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () {
                    // Logic untuk Sign in
                  },
                  child: Text(
                    "Sign in",
                    style: CustomTextStyles.titleMediumBluegray900(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      'assets/images/spotify_logo.png',
      height: 48.h,
      fit: BoxFit.contain,
    );
  }
}