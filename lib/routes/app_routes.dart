import 'package:flutter/material.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
// import '../presentation/choose_mode_screen/choose_mode_screen.dart';
// import '../presentation/get_started_screen/get_started_screen.dart';
// import '../presentation/home_screen/home_screen.dart';
import '../presentation/loading_screen/loading_screen.dart';
// import '../presentation/lyrics_screen/lyrics_screen.dart';
// import '../presentation/music_screen/music_screen.dart';
// import '../presentation/register_screen/register_screen.dart';
// import '../presentation/resister_sign_in_screen/resister_sign_in_screen.dart';
// import '../presentation/sign_in_screen/sign_in_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String loadingScreen = '/loading_screen';

  static const String getStartedScreen = '/get_started_screen';

  static const String chooseModeScreen = '/choose_mode_screen';

  static const String resisterSignInScreen = '/resister_sign_in_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String registerScreen = '/register_screen';

  static const String homeScreen = '/home_screen';

  static const String homeInitialPage = '/home_initial_page';

  static const String homenewsinitialTabPage = '/homenewsinitial_tab_page';

  static const String musicScreen = '/music_screen';

  static const String lyricsScreen = '/lyrics_screen';

  static const String articsPage = '/artics_page';

  static const String articsOnePage = '/artics_one_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    loadingScreen: (context) => LoadingScreen(),
    // getStartedScreen: (context) => GetStartedScreen(),
    // chooseModeScreen: (context) => ChooseModeScreen(),
    // resisterSignInScreen: (context) => ResisterSignInScreen(),
    // signInScreen: (context) => SignInScreen(),
    // registerScreen: (context) => RegisterScreen(),
    // homeScreen: (context) => HomeScreen(),
    // musicScreen: (context) => MusicScreen(),
    // lyricsScreen: (context) => LyricsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LoadingScreen()
  };
}
