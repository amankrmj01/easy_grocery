import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/colors.dart';

var lightTheme = ThemeData(
  primaryColor: color1,
  hintColor: color2,
  scaffoldBackgroundColor: whiteColor,
  canvasColor: color4,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: pantoneMorningMist,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 10,
    backgroundColor: Color.lerp(color5, Colors.blue, 0.3),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
  ),
  iconTheme: const IconThemeData(color: color6),
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(8),
    color: Color.lerp(color5, Colors.blue, 0.3),
    shadowColor: color7,
  ),
  useMaterial3: true,
);
