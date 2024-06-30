
import '../consts/consts.dart';

Widget appLogo({Color colorUp = Colors.white, Color colorDown = Colors.grey}) {
  return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colorDown,
            blurRadius: 7,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: colorUp,
            blurRadius: 7,
            offset: const Offset(-3, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          myLogo,
          fit: BoxFit.cover,
        ),
      ));
}
