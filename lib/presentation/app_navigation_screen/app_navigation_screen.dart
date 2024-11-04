import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_export.dart';
import '../../core/utils/size_utils.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.w,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0XFFFFFFFF),
                ),
                child: Column(
                  children: [
                    10.verticalSpace, // Menggunakan verticalSpace sebagai pengganti SizedBox(height: 10.h)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0XFF000000),
                          fontSize: 20.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Check your app's UI from the below demo screens of your",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0XFF888888),
                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    Divider(
                      height: 1,  // Gunakan nilai fixed untuk height
                      thickness: 1,  // Gunakan nilai fixed untuk thickness
                      color: const Color(0XFF000000),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Loading",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loadingScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0XFF000000),
                  fontSize: 20.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            10.verticalSpace,
            5.verticalSpace,
            Divider(
              height: 1,  // Gunakan nilai fixed
              thickness: 1,  // Gunakan nilai fixed
              color: const Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  void onTapScreenTitle(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}