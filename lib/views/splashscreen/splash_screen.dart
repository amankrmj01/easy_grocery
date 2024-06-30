import 'package:easy_grocery/consts/consts.dart';

import '../../widgets_common/appLogo_widget.dart';
import '../auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  jumpToScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => const LoginScreen());
  }

  @override
  initState() {
    jumpToScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topCenter, child: appLogo()),
                20.heightBox,
                appname.text.fontFamily(bold).size(28).extraBlack.make(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: appversion.text.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
