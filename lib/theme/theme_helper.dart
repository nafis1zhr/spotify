import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [newTheme].
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: appTheme.black900.withOpacity(0.04),
          elevation: 20,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray60001,
          fontSize: 17.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 15.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.gray80003,
          fontSize: 30.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.gray80003,
          fontSize: 26.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.blueGray10001,
          fontSize: 25.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray80004,
          fontSize: 13.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray5001,
          fontSize: 10.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray80003,
          fontSize: 14.fSize,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF42C73B),
    primaryContainer: Color(0XFF2F2F2F),
    secondaryContainer: Color(0X21AAAAAA),
    errorContainer: Color(0XFF7F7F7F),
    onError: Color(0XFFC7C7C7),
    onErrorContainer: Color(0XFF131313),
    onPrimary: Color(0XFF222222),
    onPrimaryContainer: Color(0X4CFFFFFF),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amber500 => const Color(0XFFFBBC05);
  
  // Black
  Color get black900 => const Color(0XFF000000);
  
  // Blue
  Color get blue400 => const Color(0XFF4A90E2);
  Color get blue600 => const Color(0XFF278CE8);
  
  // BlueGray
  Color get blueGray100 => const Color(0XFFD3D3D3);
  Color get blueGray10001 => const Color(0XFFD9D9D9);
  Color get blueGray400 => const Color(0XFF8D8D8D);
  Color get blueGray700 => const Color(0XFF535353);
  Color get blueGray900 => const Color(0XFF303030);
  Color get blueGray90001 => const Color(0XFF363636);
  Color get blueGray90002 => const Color(0XFF2D264B);

  // Gray
  Color get gray100 => const Color(0XFFF6F6F6);
  Color get gray10001 => const Color(0XFFF2F2F2);
  Color get gray200 => const Color(0XFFF0F0F0);
  Color get gray300 => const Color(0XFFE6E6E6);
  Color get gray30001 => const Color(0XFFDEDDDD);
  Color get gray400 => const Color(0XFFB0B0B0);
  Color get gray40001 => const Color(0XFFBEBEBE);
  Color get gray50 => const Color(0XFFF9F9F9);
  Color get gray500 => const Color(0XFFA58C8C);
  Color get gray5001 => const Color(0XFFFAFAFA);
  Color get gray600 => const Color(0XFF6C6C6C);
  Color get gray60001 => const Color(0XFF797979);
  Color get gray60003 => const Color(0XFF828282);
  Color get gray700 => const Color(0XFF606060);
  Color get gray70001 => const Color(0XFF585858);
  Color get gray800 => const Color(0XFF404040);
  Color get gray80001 => const Color(0XFF393939);
  Color get gray80002 => const Color(0XFF3F3F3F);
  Color get gray80003 => const Color(0XFF383838);
  Color get gray80004 => const Color(0XFF2A2A2A);
  
  // Green
  Color get green400 => const Color(0XFF62CD5D);
  Color get green600 => const Color(0XFF37B332);
  
  // Red
  Color get red500 => const Color(0XFFEA4335);
}
