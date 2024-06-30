import 'package:easy_grocery/consts/consts.dart';
import 'package:fluentui_icons/fluentui_icons.dart';


import '../../controllers/home_controllers.dart';
import '../screeens/cart_screen.dart';
import '../screeens/category_screen.dart';
import '../screeens/settings_screen.dart';
import 'home_screen.dart';

class HomeStructure extends StatefulWidget {
  const HomeStructure({super.key});

  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure>
    with TickerProviderStateMixin {
  final Color color6 = const Color(0xFFe76f51);
  final Color color2 = const Color(0xFFfefae0);
  final HomeController controller = Get.put(HomeController(), permanent: true);
  final GlobalKey bottomNavigationKey = GlobalKey();
  final ValueNotifier<int> currentScreenIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    ever(controller.currentIndex, (_) {
      currentScreenIndex.value = controller.currentIndex.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => bottomNavBar(context, controller)),
      body: Container(
        alignment: Alignment.center,
        child: switchScreen(),
      ),
    );
  }

  Widget switchScreen() {
    return ValueListenableBuilder(
        valueListenable: currentScreenIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return switch (value) {
            0 => const HomeScreen(),
            1 => const CategoryScreen(),
            2 => const CartScreen(),
            3 => const SettingsScreen(),
            _ => throw UnimplementedError()
          };
        });
  }

  Theme bottomNavBar(BuildContext context, HomeController controller) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        key: bottomNavigationKey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: color6,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.currentIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: inactiveIcon(
                icon: FluentSystemIcons.ic_fluent_home_regular, index: 0),
            activeIcon: activeIcon(
                index: 0, icon: FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: inactiveIcon(icon: Icons.category_outlined, index: 1),
            activeIcon: activeIcon(index: 1, icon: Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: inactiveIcon(icon: Icons.shopping_cart_outlined, index: 2),
            activeIcon: activeIcon(index: 2, icon: Icons.shopping_cart_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: inactiveIcon(
                icon: FluentSystemIcons.ic_fluent_settings_regular, index: 3),
            activeIcon: activeIcon(
              index: 3,
              icon: FluentSystemIcons.ic_fluent_settings_filled,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  AnimatedBuilder inactiveIcon({required IconData icon, required int index}) {
    return AnimatedBuilder(
      animation: currentScreenIndex,
      builder: (BuildContext context, Widget? child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: currentScreenIndex.value == index ? 50 : 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color6),
        );
      },
    );
  }

  AnimatedBuilder activeIcon({required IconData icon, required int index}) {
    return AnimatedBuilder(
      animation: currentScreenIndex,
      builder: (BuildContext context, Widget? child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: currentScreenIndex.value == index ? 50 : 30,
          height: 30,
          decoration: BoxDecoration(
              color: currentScreenIndex.value == index
                  ? color6
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color2),
        );
      },
    );
  }
}
