import 'package:flutter/material.dart';
import 'package:proplus_task/components/componenta_export.dart';
import 'package:proplus_task/components/constants/colors.dart';
import 'package:proplus_task/main.dart';

ThemeData  theme() {
  return ThemeData(
    primaryColor: ConstantColor.primary,
    elevatedButtonTheme: _getButtonTheme,
    scaffoldBackgroundColor: ConstantColor.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.black0,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.12,
      ),
      titleMedium: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.primary5F607E,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.12,
        // height: 2.7,
      ),
      titleSmall: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.12,
        // height: 2.7,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.12,
        // height: 2.7,
      ),
      bodySmall: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.12,
        // height: 2.7,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.inter,
        color: ConstantColor.greyE1E2FF,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.12,
        // height: 2.7,
      )
    ),
  );
}

double pixelsToDouble(double pixelValue) {
  // Get the device pixel ratio
  double pixelRatio = MediaQuery.of(navigatorKey.currentContext!).devicePixelRatio;

  // Convert pixel to logical pixels (double)
  double logicalPixels = pixelValue / pixelRatio;

  return logicalPixels;
}

ElevatedButtonThemeData get _getButtonTheme {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(14),
      backgroundColor: ConstantColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  );
}

class GetTextStyle {
  static TextStyle? get styleS20W500Black {
    return Theme.of(navigatorKey.currentContext!).textTheme.titleLarge;
  }

  static TextStyle? get styleS16W400Primary5f60 {
    return Theme.of(navigatorKey.currentContext!).textTheme.titleMedium;
  }
  static TextStyle? get styleS14W500White {
    return Theme.of(navigatorKey.currentContext!).textTheme.titleSmall;
  }
  static TextStyle? get styleS18W500White {
    return Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium;
  }
  static TextStyle? get styleS16W500TextColor {
    return Theme.of(navigatorKey.currentContext!).textTheme.bodySmall;
  }
  static TextStyle? get styleS14W400GreyE1E2FF {
    return Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge;
  }
}
