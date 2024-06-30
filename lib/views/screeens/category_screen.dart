import 'package:easy_grocery/consts/consts.dart';

import 'details_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  bool _scrolledToEnd = false;
  List products = [
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

  List productsOptions = [
    'Dress',
    'Shoes',
    'Accessories',
    'Dresses',
    'Jackets',
    'Electronics',
    'Pants',
    'Shorts'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  // Horizontal list of cards
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const RangeMaintainingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: productsOptions.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentPage = index;
                            });
                            _pageController.animateToPage(
                              index,
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20),
                            child: Card(
                              color: _currentPage == index
                                  ? skinDark
                                  : Color.lerp(skinDark, Colors.white, 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  productsOptions[index],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // PageView for the vertical lists
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox(
                    height: constraints.maxHeight - 80,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                        if (index < productsOptions.length - 3) {
                          _scrollController.animateTo(
                            index * 100.0,
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 600),
                          );
                          _scrolledToEnd =
                              false; // Reset the flag when scrolling to other positions
                        } else if (!_scrolledToEnd) {
                          _scrollController.animateTo(
                            (productsOptions.length - 3) * 100.0 + 50,
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 600),
                          );
                          _scrolledToEnd =
                              true; // Set the flag to true after scrolling to the end
                        }
                      },
                      itemCount: productsOptions.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: products.length,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.topCenter,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => ProductDetailsScreen(
                                              imgUrl: products[index],
                                            ),
                                        duration:
                                            const Duration(milliseconds: 300),
                                        transition: Transition.zoom,
                                        curve: Curves.easeInOutCubic,
                                        opaque: true,
                                        popGesture: true,
                                        preventDuplicates: true,
                                        fullscreenDialog: false,
                                        arguments: products[index].toString());
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              products[index],
                                              fit: BoxFit.fitWidth,
                                              // height: 200,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Product Name',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      '\u20B9 100',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          'Add to Cart'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
