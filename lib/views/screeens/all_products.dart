import 'package:easy_grocery/consts/consts.dart';

import 'details_screen.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final List products = [
    imgFc1,
    imgFc2,
    imgFc3,
    imgFc4,
    imgFc5,
    imgFc6,
    imgFc7,
    imgFc8,
    imgFc9,
    imgFc10
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: 'All Products'
            .text
            .color(whiteColor)
            .fontFamily(bold)
            .size(24)
            .make(),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      width: context.screenWidth * 0.45,
                      child: Wrap(
                        verticalDirection: VerticalDirection.up,
                        children:
                            List.generate((products.length ~/ 2), (index) {
                          return CustomCard(
                            imgUrl: products[index],
                          );
                        }),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      width: context.screenWidth * 0.45,
                      child: Wrap(
                        verticalDirection: VerticalDirection.up,
                        children:
                            List.generate((products.length ~/ 2), (index) {
                          return CustomCard(
                              imgUrl: products[products.length ~/ 2 + index]);
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imgUrl;

  const CustomCard({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(imgUrl: imgUrl));
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: Vx.dp5,
                    right: Vx.dp5,
                    child: CircleAvatar(
                      maxRadius: 16,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Vx.dp5,
                    left: Vx.dp5,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        '4.0'.text.color(Colors.black).make(),
                        5.widthBox
                      ],
                    ).box.white.roundedSM.make(),
                  ),
                ],
              ),
              10.heightBox,
              'Product Name'
                  .text
                  .color(Colors.black)
                  .fontFamily(bold)
                  .size(20)
                  .make(),
              5.heightBox,
              '\u20B9 100'
                  .text
                  .color(Colors.grey[800])
                  .fontFamily(bold)
                  .size(16)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
