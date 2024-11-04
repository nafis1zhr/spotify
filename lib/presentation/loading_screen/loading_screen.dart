import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../get_started_screen/get_started_screen.dart'; // Import layar tujuan
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/spotify_logo.png',
            width: 120.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

StartedScreen() {
}
