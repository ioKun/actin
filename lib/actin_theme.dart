import 'package:flutter/material.dart';

final pallete = ["264653", "2A9D8F", "E9C46A", "F4A261", "E76F51"];

// C:src\flutter\bin\flutter
//pub run build_runner build --delete-conflicting-outputs
class ActinTheme {
  static Color toColor(String s) {
    final colorString = 'FF$s';
    return Color(int.parse(colorString, radix: 16));
  }

  static toMaterialColor(Color c) {
    Map<int, Color> colorCodes = {
      50: Color.fromRGBO(c.red, c.green, c.blue, .1),
      100: Color.fromRGBO(c.red, c.green, c.blue, .2),
      200: Color.fromRGBO(c.red, c.green, c.blue, .3),
      300: Color.fromRGBO(c.red, c.green, c.blue, .4),
      400: Color.fromRGBO(c.red, c.green, c.blue, .5),
      500: Color.fromRGBO(c.red, c.green, c.blue, .6),
      600: Color.fromRGBO(c.red, c.green, c.blue, .7),
      700: Color.fromRGBO(c.red, c.green, c.blue, .8),
      800: Color.fromRGBO(c.red, c.green, c.blue, .9),
      900: Color.fromRGBO(c.red, c.green, c.blue, 1),
    };
    return MaterialColor(c.value, colorCodes);
  }

  static get theme {
    final originalTextTheme = ThemeData.dark().textTheme;
    final color1 = toMaterialColor(toColor(pallete[0]));
    final color2 = toMaterialColor(toColor(pallete[1]));
    final color3 = toMaterialColor(toColor(pallete[2]));
    final color4 = toMaterialColor(toColor(pallete[3]));
    final color5 = toMaterialColor(toColor(pallete[4]));
    return ThemeData.light().copyWith(
      primaryColor: toMaterialColor(toColor(pallete[0])),
      accentColor: toMaterialColor(toColor(pallete[1])),
      buttonColor: toMaterialColor(toColor(pallete[2])),
      backgroundColor: toMaterialColor(toColor(pallete[3])),
      highlightColor: toMaterialColor(toColor(pallete[4])),
    );

    // ThemeData.from(
    //     colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: color1,
    //   primaryColorDark: color2,
    //   accentColor: color3,
    //   cardColor: color2,
    //   backgroundColor: color1,
    //   errorColor: color5,
    // )).copyWith(textTheme: originalTextTheme);
  }
}
