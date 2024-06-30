import 'package:easy_grocery/consts/consts.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String imgUrl;
  const ProductDetailsScreen({super.key, required this.imgUrl});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double rating = 4.3;
  final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

  final reviewImages = [imgRev1, imgRev2, imgRev3];
  final colorsAvailable = List.generate(
    3,
    (index) {
      return VxBox()
          .color(Vx.randomPrimaryColor)
          .size(50, 50)
          .roundedFull
          .make()
          .p8();
    },
  );

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showFloatingIcon = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _shouldLoad1 = ValueNotifier<bool>(false);
  // final ValueNotifier<bool> _shouldLoad2 = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState(); // Change the delay as needed
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) {
        if (!_shouldLoad1.value) {
          _shouldLoad1.value = true;
        }

        if (!_showFloatingIcon.value) {
          _showFloatingIcon.value = true;
        }
      } else {
        if (_showFloatingIcon.value) {
          _showFloatingIcon.value = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 10,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          AnimatedBuilder(
            animation: _showFloatingIcon,
            builder: (context, child) {
              return Positioned(
                right: 30,
                bottom: 60,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: _showFloatingIcon.value ? 1.0 : 0.0,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: _showFloatingIcon.value ? 1.0 : 0.0,
                    child: FloatingActionButton.extended(
                      heroTag: 'add',
                      onPressed: () {
                        // Handle button press
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add to Cart'),
                      hoverElevation: 5,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: appbarHeight,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.imgUrl,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child: IconButton.outlined(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child: IconButton.outlined(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹ 1000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        VxRating(
                          value: rating,
                          onRatingUpdate: (value) {
                            setState(() {
                              rating = double.parse(value);
                            });
                          },
                          isSelectable: true,
                          count: 5,
                          size: 28,
                          stepInt: true,
                          normalColor: lightGrey,
                          selectionColor: Colors.amber,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '4.0',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Seller Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Seller',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.message_rounded, color: Colors.grey),
                        10.widthBox,
                      ],
                    ).box.roundedSM.color(textFieldGrey).make(),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            10.widthBox,
                            SizedBox(
                              width: 100,
                              child: 'Color'.text.size(20).make(),
                            ),
                            Row(children: colorsAvailable),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            10.widthBox,
                            SizedBox(
                              width: 120,
                              child: 'Add to Cart'.text.size(20).make(),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  ),
                                  '0'.text.size(20).make(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                            '0 Available'
                                .text
                                .color(Colors.grey)
                                .size(16)
                                .make(),
                            10.widthBox,
                          ],
                        ),
                        Row(
                          children: [
                            10.widthBox,
                            SizedBox(
                              width: 120,
                              child: 'Total: '.text.size(20).make(),
                            ),
                            const Expanded(child: SizedBox()),
                            '₹ 1000'.text.size(20).bold.make(),
                            20.widthBox
                          ],
                        ).box.color(Vx.orange200).make().py16(),
                        4.heightBox,
                      ],
                    ).box.roundedSM.white.make(),
                    const SizedBox(height: 10),
                  ],
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _isExpanded,
                  builder: (context, value, child) {
                    return ExpansionTile(
                      childrenPadding: const EdgeInsets.all(10),
                      collapsedBackgroundColor: textFieldGrey,
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onExpansionChanged: (expanding) {
                        _isExpanded.value = expanding;
                      },
                      backgroundColor: textFieldGrey,
                      subtitle: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _isExpanded.value ? 0.0 : 1.0,
                        child: const Text(
                          'Your description goes here...Your description goes here...Your description goes here...Your description goes here...',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      children: const <Widget>[
                        Text(
                          'Your description goes here...',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<bool>(
                  valueListenable: _shouldLoad1,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Reviews'.text.size(20).make(),
                            TextButton(
                                onPressed: () {}, child: 'View ALl'.text.make())
                          ],
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder(
                          future: value
                              ? Future.delayed(const Duration(seconds: 2))
                              : Future.delayed(const Duration(days: 1)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return VxShimmer(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: context.width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    10.widthBox,
                                    Expanded(
                                      child: Container(
                                        height: 200,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // Return your actual widget here
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(3, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          reviewImages[index],
                                          height: 200,
                                          width: context.width * 0.7,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ).box.white.roundedSM.make();
                  },
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  collapsedBackgroundColor: textFieldGrey,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: textFieldGrey,
                  title: const Text(
                    'Return Policy',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  children: const <Widget>[
                    Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your description goes here...',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ExpansionTile(
                  childrenPadding: const EdgeInsets.all(10),
                  collapsedBackgroundColor: textFieldGrey,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: textFieldGrey,
                  title: const Text(
                    'Support Policy',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  children: const <Widget>[
                    Divider(
                      color: Colors.black,
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your description goes here...',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                ValueListenableBuilder<bool>(
                  valueListenable: _shouldLoad1,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Similar Products',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder(
                          future: value
                              ? Future.delayed(const Duration(seconds: 2))
                              : Future.delayed(const Duration(days: 1)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return VxShimmer(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: context.width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    10.widthBox,
                                    Expanded(
                                      child: Container(
                                        height: 200,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // Return your actual widget here
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(3, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          reviewImages[index],
                                          height: 200,
                                          width: context.width * 0.7,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ).box.roundedSM.white.make();
                  },
                ),
                30.heightBox,
                // VisibilityDetector(
                //   key: const Key('similarProducts'),
                //   onVisibilityChanged: (VisibilityInfo info) {
                //     if (info.visibleFraction == 1) {
                //     } else if (info.visibleFraction == 0) {
                //     } else {
                //       print('Similar Products is partially visible');
                //     }
                //   },
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(height: 10),
                //       const Text(
                //         'Similar Products',
                //         style: TextStyle(
                //           fontSize: 20,
                //         ),
                //       ),
                //       const SizedBox(height: 10),
                //       SingleChildScrollView(
                //         scrollDirection: Axis.horizontal,
                //         child: Row(
                //           children: List.generate(5, (index) {
                //             return Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(10),
                //                 child: Image.asset(
                //                   imgP1,
                //                   height: 200,
                //                   width: context.width * 0.7,
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //             );
                //           }),
                //         ),
                //       ),
                //     ],
                //   ),
                // ).box.roundedSM.white.make()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
