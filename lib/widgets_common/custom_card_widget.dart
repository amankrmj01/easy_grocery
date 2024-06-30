
import 'package:get/get.dart';

import '../consts/consts.dart';
import '../views/screeens/details_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.products,
    required this.index,
  });
  final int index;
  final List products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              imgUrl: products[index],
            ));
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
                      products[index],
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
