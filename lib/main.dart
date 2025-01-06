import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'presentation/get_started_screen/get_started_screen.dart';
//import 'presentation/sign_in_screen/sign_in_screen.dart';
//import 'presentation/register_sign_in_screen/register_sign_in_screen.dart';
//import 'presentation/loading_screen/loading_screen.dart';
//import 'presentation/register_screen/register_screen.dart';
import 'presentation/home_screen/home_screen.dart';
//import 'presentation/app_navigation_screen/app_navigation_screen.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Sesuaikan dengan dimensi desain Anda
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(), // Tampilkan LoadingScreen sebagai layar utama
        );
      },
    );
  }
}