import 'package:easy_grocery/consts/consts.dart';

import '../../widgets_common/bg_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
        height: context.screenHeight * 0.5,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          imgProfile3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    40.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ('John Doe').text.size(20).make(),
                        ('john@gmail.com').text.size(16).make()
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.2),
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: () {},
                      child: ('Log Out')
                          .text
                          .color(Colors.black)
                          .extraBlack
                          .make(),
                    ),
                  ],
                ),
                40.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        8.heightBox,
                        ('Orders').text.extraBlack.size(20).make(),
                        10.heightBox,
                        ('In Cart').text.size(16).make(),
                        8.heightBox,
                      ],
                    )
                        .box
                        .roundedSM
                        .width(context.screenWidth * 0.3)
                        .white
                        .make(),
                    Column(
                      children: [
                        8.heightBox,
                        ('Shipping').text.extraBlack.size(20).make(),
                        10.heightBox,
                        ('Wishlist').text.size(16).make(),
                        8.heightBox,
                      ],
                    )
                        .box
                        .roundedSM
                        .width(context.screenWidth * 0.3)
                        .white
                        .make(),
                    Column(
                      children: [
                        8.heightBox,
                        ('Payment').text.extraBlack.size(20).make(),
                        10.heightBox,
                        ('Total Orders').text.size(16).make(),
                        8.heightBox,
                      ],
                    )
                        .box
                        .roundedSM
                        .width(context.screenWidth * 0.3)
                        .white
                        .make(),
                  ],
                ),
                40.heightBox,
                ListView(
                  padding: const EdgeInsets.only(bottom: 10),
                  shrinkWrap: true,
                  children: ListTile.divideTiles(
                    color: Colors.white,
                    context: context,
                    tiles: [
                      ListTile(
                        title: ('My Orders').text.size(18).make(),
                        leading: const Icon(Icons.shopping_cart_rounded),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: ('My Wishlist').text.size(18).make(),
                        leading: const Icon(Icons.favorite),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: ('Profile').text.size(18).make(),
                        leading: const Icon(Icons.person),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: ('Settings').text.size(18).make(),
                        leading: const Icon(Icons.settings),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: ('Help').text.size(18).make(),
                        leading: const Icon(Icons.help),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: ('About').text.size(18).make(),
                        leading: const Icon(Icons.info),
                        onTap: () {},
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ).toList(),
                )
                    .box
                    .roundedSM
                    .shadowSm
                    .color(Color.lerp(
                        Colors.white.withOpacity(0.8), Colors.amber, 0.1)!)
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
