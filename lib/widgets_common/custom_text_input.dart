
import '../consts/consts.dart';

Widget customTextInput(
    {required BuildContext context,
    required String text,
    required String hint,
    required bool isPassword,
    required TextEditingController controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text.isNotEmpty
          ? (text).text.color(skinDark).fontFamily(semibold).size(16).make()
          : 0.heightBox,
      5.heightBox,
      TextFormField(
        controller: controller,
        obscureText: isPassword,
        // onTapOutside: (event) {
        //   FocusScope.of(context).unfocus();
        // },
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontFamily: semibold, color: Colors.grey),
          hintText: hint,
          hintFadeDuration: const Duration(milliseconds: 400),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: skinLight, width: 2),
          ),
        ),
      ),
    ],
  );
}
