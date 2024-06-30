
import '../consts/consts.dart';

Widget customHomeButton({
  required BuildContext context,
  required String text,
  required String imgLink,
  Color shadowColor = skinLight,
  double height = 100,
  required VoidCallback onTap,
}) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Vx.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: morningMist,
            offset: Offset(0, 0),
            blurRadius: 10,
            // spreadRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                imgLink,
                width: 30,
              ),
            ),
            5.heightBox,
            Expanded(
                child: text.text
                    .color(skinDark)
                    .fontFamily(semibold)
                    .size(20)
                    .center
                    .make()),
          ],
        ),
      ),
    ),
  );
}
