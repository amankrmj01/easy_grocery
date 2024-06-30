import 'dart:ui';

import '../consts/consts.dart';
Widget bgWidget({Widget? child, required double height}) {
  return Stack(children: [
    Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(),
          child: Image.asset(
            imgBackground,
            fit: BoxFit.fitWidth,
          ),
        )),
    child!,
  ]);
}
