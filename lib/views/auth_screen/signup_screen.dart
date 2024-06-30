
import '../../consts/consts.dart';

import '../../controllers/auth_controllers.dart';
import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/customButton_widget.dart';
import '../../widgets_common/custom_text_input.dart';
import '../home_screen/home_structure.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? checkValue = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  AuthControllers authControllers = Get.put(AuthControllers());

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: SafeArea(
        child: bgWidget(
          height: 300,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom:
                      (keyboardHeight - 300) > 0 ? (keyboardHeight - 300) : 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (context.screenHeight * 0.1).heightBox,
                    appLogo(colorUp: Colors.white),
                    40.heightBox,
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: ('SignUp').text.extraBlack.size(28).make(),
                        ),
                        customTextInput(
                            context: context,
                            text: 'Name',
                            hint: 'Full Name',
                            isPassword: false,
                            controller: nameController),
                        10.heightBox,
                        customTextInput(
                            context: context,
                            text: 'Email',
                            hint: 'Enter your email',
                            isPassword: false,
                            controller: emailController),
                        10.heightBox,
                        customTextInput(
                            context: context,
                            text: 'Password',
                            hint: '*******',
                            isPassword: true,
                            controller: passwordController),
                        10.heightBox,
                        customTextInput(
                            context: context,
                            text: 'Re Enter Password',
                            hint: '*******',
                            isPassword: true,
                            controller: rePasswordController),
                        15.heightBox,
                        Row(
                          children: [
                            Checkbox(
                                activeColor: skinDark,
                                value: checkValue,
                                onChanged: (value) {
                                  setState(() {
                                    checkValue = value!;
                                  });
                                }),
                            Expanded(
                                child: RichText(
                              text: const TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(color: skinDark),
                                  ),
                                  TextSpan(
                                    text: ' & ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: skinDark),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                        customButton(
                          backgroundColor: checkValue! ? skinDark : Colors.grey,
                          context: context,
                          text: 'SignUp',
                          onPressed: checkValue!
                              ? () {
                                  Get.off(() => const HomeStructure());
                                }
                              : () {},
                        ),
                        15.heightBox,
                        Row(
                          children: [
                            ('Already have an account?').text.make(),
                            15.widthBox,
                            Expanded(
                              child: customButton(
                                  size: 14,
                                  height: 40,
                                  context: context,
                                  text: 'LogIn',
                                  onPressed: () {
                                    Get.off(() => const LoginScreen(),
                                        transition: Transition.leftToRight,
                                        duration:
                                            const Duration(milliseconds: 600));
                                  },
                                  textColor: skinDark,
                                  overlayColor: Colors.deepOrangeAccent,
                                  backgroundColor: Colors.white),
                            ),
                            15.widthBox,
                          ],
                        ),
                        5.heightBox,
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .make()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
