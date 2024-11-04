import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/register_sign_in_screen/register_sign_in_screen.dart';
//import 'presentation/loading_screen/loading_screen.dart';
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
          home: const RegisterSignInScreen(), // Tampilkan LoadingScreen sebagai layar utama
        );
      },
    );
  }
}