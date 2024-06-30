
import '../../consts/consts.dart';
import '../../consts/social_icons.dart';
import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/customButton_widget.dart';
import '../../widgets_common/custom_text_input.dart';
import '../home_screen/home_structure.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  jumpToHome() async {
    await Future.delayed(const Duration(milliseconds: 800));
    Get.off(() => const HomeStructure());
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: SafeArea(
        child: bgWidget(
          height: 300,
          child: SingleChildScrollView(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.only(
                  bottom:
                      (keyboardHeight - 300) > 0 ? (keyboardHeight - 300) : 10),
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
                          child: ('LogIn').text.extraBlack.size(28).make(),
                        ),
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
                        5.heightBox,
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                animationDuration:
                                    const Duration(milliseconds: 400),
                                // splashFactory: InkSplash.splashFactory,
                                overlayColor: skinLight),
                            onPressed: () {},
                            child: ('Forgot Password?')
                                .text
                                .color(skinDark)
                                .align(TextAlign.right)
                                .make(),
                          ),
                        ),
                        10.heightBox,
                        customButton(
                          context: context,
                          text: 'LogIn',
                          onPressed: () async {
                            await Future.delayed(const Duration(
                                milliseconds: 600)); // Wait for 600ms
                            Get.off(() => const HomeStructure());
                          },
                        ),
                        15.heightBox,
                        Row(
                          children: [
                            ('Don\'t have an account?').text.make(),
                            15.widthBox,
                            Expanded(
                              child: customButton(
                                  size: 14,
                                  height: 40,
                                  context: context,
                                  text: 'SignUp',
                                  onPressed: () {
                                    Get.off(() => const SignUpScreen(),
                                        transition: Transition.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 600));
                                  },
                                  textColor: skinDark,
                                  overlayColor: Colors.deepOrangeAccent,
                                  backgroundColor: Colors.white),
                            ),
                            15.widthBox
                          ],
                        ),
                        5.heightBox,
                        ('Or Login with').text.make(),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            3,
                            (index) => CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  socialIconList[index],
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .outerShadowLg
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
