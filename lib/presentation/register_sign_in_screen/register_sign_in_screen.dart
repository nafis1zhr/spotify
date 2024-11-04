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
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildBackgroundImage(context),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildVectorRow(),
                        SizedBox(height: 20.h), // Spasi sebelum logo
                        _buildLogo(context),
                        SizedBox(height: 20.h), // Spasi sebelum teks
                        Text(
                          "Enjoy listening to music",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
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
                          'assets/images/ruwet2.png',
                          height: 568.h,
                          width: 250.h,
                          fit: BoxFit.cover,
                        ),
                      ],
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
      height: 480.h, // Meningkatkan tinggi untuk mengakomodasi gambar
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/bule2.png',
            height: 480.h, // Meningkatkan tinggi untuk mengakomodasi gambar
            width: double.infinity,
            fit: BoxFit.contain, // Mengubah fit agar gambar tidak terpotong
          ),
          _buildRegisterRow(context),
        ],
      ),
    );
  }

  Widget _buildRegisterRow(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 22.h, left: 30.h, right: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Tombol Register dengan SizedBox untuk lebar tetap
            SizedBox(
              width: 140.h, // Tentukan lebar untuk tombol Register
              child: CustomElevatedButton(
                height: 72.h,
                text: "Register",
                buttonStyle: CustomButtonStyles.none,
                buttonTextStyle: CustomTextStyles.titleMediumOnPrimaryContainer(context),
                onPressed: () {
                  // Logic untuk Register
                },
              ),
            ),
            SizedBox(width: 20.h), // Jarak yang sama untuk kedua tombol
            // Tombol Sign In
            GestureDetector(
              onTap: () {
                // Logic untuk Sign In
              },
              child: SizedBox(
                width: 140.h, // Pastikan lebar tombol Sign In sama dengan Register
                child: Text(
                  "Sign in",
                  style: CustomTextStyles.titleMediumBluegray900(context),
                  textAlign: TextAlign.center, // Rata tengah untuk teks
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVectorRow() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/ruwet1.png',
            height: 208.h,
            width: 228.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/spotify_logo.png',
        height: 100.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
