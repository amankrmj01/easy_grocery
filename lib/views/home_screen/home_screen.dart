
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as ibs;
import 'package:easy_grocery/consts/consts.dart';

import '../../widgets_common/custom_home_buttons.dart';
import '../../widgets_common/custom_text_input.dart';
import '../screeens/all_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final brandLists = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];
  final featuredList1 = [
    [imgS1, 'Woman Fashion'],
    [imgS2, 'Woman Wedding Collection'],
    [imgS3, 'Kurtis'],
  ];
  final featuredList2 = [
    [imgS6, 'Boys Fashion'],
    [imgS7, 'Boys Shoes'],
    [imgS8, 'Electronics'],
    [imgS9, 'Appliances'],
  ];

  final featuredProducts = [imgP1, imgP2, imgP3, imgP4, imgP5];
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

  double iconSize = 30.0;
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      searchInputContainer(context),
                      15.widthBox,
                      customAnimatedIcon(),
                    ],
                  ),
                  20.heightBox,
                  salesSwiper(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customHomeButton(
                          context: context,
                          text: 'Today\'s Deal',
                          onTap: () {},
                          imgLink: icTodaysDeal),
                      customHomeButton(
                          context: context,
                          text: 'Flash Deals',
                          onTap: () {},
                          imgLink: icFlashDeal)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customHomeButton(
                          context: context,
                          text: 'Top Categories',
                          imgLink: icTopCategories,
                          onTap: () {}),
                      customHomeButton(
                          context: context,
                          text: 'Top Sellers',
                          imgLink: icTopSeller,
                          onTap: () {}),
                      customHomeButton(
                          context: context,
                          text: 'Top Brands',
                          imgLink: icBrands,
                          onTap: () {}),
                    ],
                  ),
                  5.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ('   Featured Categories')
                        .text
                        .color(skinDark)
                        .fontFamily(semibold)
                        .size(20)
                        .make(),
                  ),
                  5.heightBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      featuredCategories(featuredList1),
                      20.heightBox,
                      featuredCategories(featuredList2),
                    ],
                  ),
                  20.heightBox,
                  buildFeaturedProducts(),
                  20.heightBox,
                  allProducts(),
                  5.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container viewAllButton() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.amber],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ('View All').text.color(whiteColor).fontFamily(bold).size(16).make(),
          const Expanded(child: SizedBox()),
          VerticalDivider(
            color: Color.lerp(Colors.white, Colors.orange, 0.4),
            thickness: 2,
            width: 0,
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            onPressed: () {
              Get.to(() => const AllProducts());
            },
            icon: const Icon(
              color: whiteColor,
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
            selectedIcon: const Icon(
              color: whiteColor,
              Icons.arrow_forward_ios_rounded,
              size: 10,
            ),
          )
        ],
      ),
    );
  }

  allProducts() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFFE0Eaf3), Color(0xFFCFDEF3)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ('All Products')
              .text
              .color(whiteColor)
              .fontFamily(bold)
              .size(24)
              .make(),
          const Divider(
            thickness: 2,
            color: Colors.white,
            height: 16,
          ),
          FutureBuilder(
            // Delay of 2 seconds
            future: Future.delayed(const Duration(seconds: 5)),
            builder: (context, snapshot) {
              // Show VxShimmer while waiting for Future to complete
              if (snapshot.connectionState != ConnectionState.done) {
                return VxShimmer(
                  child: Row(
                    children: [
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Once the 2 seconds have passed, show the featured categories
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: featuredProducts.length,
                  itemBuilder: (context, index) {
                    return CustomCard(imgUrl: featuredProducts[index]);
                  },
                );
              }
            },
          ),
          const Divider(
            thickness: 2,
            height: 20,
            color: Colors.white,
          ),
          viewAllButton(),
        ],
      ),
    );
  }

  Container buildFeaturedProducts() {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFFE0Eaf3), Color(0xFFCFDEF3)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ('Featured Products')
              .text
              .color(whiteColor)
              .fontFamily(bold)
              .size(24)
              .make(),
          FutureBuilder(
            // Delay of 2 seconds
            future: Future.delayed(const Duration(seconds: 5)),
            builder: (context, snapshot) {
              // Show VxShimmer while waiting for Future to complete
              if (snapshot.connectionState != ConnectionState.done) {
                return VxShimmer(
                  child: Row(
                    children: [
                      Container(
                        height: context.screenHeight * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: context.screenHeight * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Once the 2 seconds have passed, show the featured categories
                return Flexible(
                  child: ListView.builder(
                    itemCount: featuredProducts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            runAlignment: WrapAlignment.start,
                            direction: Axis.vertical,
                            children: [
                              SizedBox(
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    featuredProducts[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ('Product Name')
                                  .text
                                  .color(skinDark)
                                  .fontFamily(semibold)
                                  .size(20)
                                  .make(),
                              ('\u20B9 100')
                                  .text
                                  .color(skinDark)
                                  .fontFamily(semibold)
                                  .size(20)
                                  .make(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  FutureBuilder featuredCategories(List featuredList) {
    return FutureBuilder(
      // Delay of 2 seconds
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        // Show VxShimmer while waiting for Future to complete
        if (snapshot.connectionState != ConnectionState.done) {
          return VxShimmer(
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
          );
        }

        // Once the 2 seconds have passed, show the featured categories
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(featuredList.length, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color.lerp(Colors.white, Colors.amber, 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          featuredList[index][0],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    5.widthBox,
                    Center(
                        child: Text(
                      featuredList[index][1],
                      style: const TextStyle(
                        color: skinDark,
                        fontFamily: semibold,
                      ),
                    )),
                    10.widthBox,
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }

  FutureBuilder salesSwiper() {
    return FutureBuilder(
      // Delay of 2 seconds
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        // Show VxShimmer while waiting for Future to complete
        if (snapshot.connectionState != ConnectionState.done) {
          return VxShimmer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        // Once the 2 seconds have passed, show the VxSwiper
        return VxSwiper.builder(
          itemCount: brandLists.length,
          aspectRatio: 16 / 8,
          height: 150,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.ease,
          itemBuilder: (context, index) {
            return Image.asset(
              brandLists[index],
              fit: BoxFit.cover,
            )
                .box
                .withRounded(value: 20.0)
                .clip(Clip.antiAlias)
                .outerShadow3Xl
                .margin(const EdgeInsets.symmetric(horizontal: 10))
                .make();
          },
        );
      },
    );
  }

  Expanded searchInputContainer(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: customTextInput(
            context: context,
            text: '',
            hint: 'Search anything',
            isPassword: false,
            controller: searchController),
      ),
    );
  }

  Container customAnimatedIcon() {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: GestureDetector(
        onTapUp: (d) {
          setState(() {
            iconSize = 40.0; // Original of the icon
          });
        },
        onTapDown: (d) {
          setState(() {
            iconSize = 30.0; // New size size of the icon
          });
        },
        child: AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
          decoration: ibs.BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              boxShadow: [
                ibs.BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                  inset: iconSize == 30 ? true : false,
                ),
              ]),
          width: 50,
          height: 50,
          child: Icon(
            Icons.search,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
