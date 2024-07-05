// import 'package:ecommerce_app/constants/colors.dart';
// import 'package:ecommerce_app/constants/icon_assets.dart';
// import 'package:ecommerce_app/constants/text_style.dart';
// import 'package:ecommerce_app/view/screens/bag_screens/bag_screen.dart';
// import 'package:ecommerce_app/view/screens/favorites_screens/favourites_Screen.dart';
// import 'package:ecommerce_app/view/screens/home_screens/home_screen.dart';
// import 'package:ecommerce_app/view/screens/profile_screens/profile_screen.dart';
// import 'package:ecommerce_app/view/screens/shop_screens/shop_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   dynamic selected;
//   PageController? _pageController;
//   int _currentPage = 0;
//   bool _isPageControllerInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadCurrentPage();
//   }

//   Future<void> _loadCurrentPage() async {
//     final prefs = await SharedPreferences.getInstance();
//     _currentPage = prefs.getInt('currentPage') ?? 0;
//     setState(() {
//       _pageController = PageController(initialPage: _currentPage);
//       _isPageControllerInitialized = true;
//     });
//   }

//   // Save the current page index to SharedPreferences
//   Future<void> _saveCurrentPage(int page) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('currentPage', 0);
//   }

//   @override
//   void dispose() {
//     _pageController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: _isPageControllerInitialized
//           ? PageView(
//               physics: const NeverScrollableScrollPhysics(),
//               controller: _pageController!,
//               onPageChanged: (int page) {
//                 setState(() {
//                   _currentPage = page;
//                 });
//                 _saveCurrentPage(page);
//               },
//               children: const [
//                 HomeScreen(),
//                 ShopScreen(),
//                 BagScreen(),
//                 FavoritesScreen(),
//                 ProfileScreen(),
//               ],
//             )
//           : const Center(),
//       bottomNavigationBar: Container(
//         width: ScreenUtil().scaleWidth,
//         height: 83.h,
//         decoration: const BoxDecoration(
//             color: kColor.whiteColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12), topRight: Radius.circular(12))),
//         child: StylishBottomBar(
//           option: AnimatedBarOptions(
//             barAnimation: BarAnimation.blink,
//             iconStyle: IconStyle.Default,
//           ),
//           items: [
//             BottomBarItem(
//                 icon: SvgPicture.asset(
//                   IconAssets.home.toString(),
//                   colorFilter: const ColorFilter.mode(
//                       kColor.text2Color, BlendMode.srcIn),
//                 ),
//                 selectedIcon: SvgPicture.asset(
//                   IconAssets.homeFill.toString(),
//                   colorFilter:
//                       const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
//                 ),
//                 title: Text(
//                   'Home',
//                   style: appStyle(fw: FontWeight.w700, size: 10.sp),
//                 ),
//                 selectedColor: kColor.redColor,
//                 unSelectedColor: kColor.text2Color),
//             BottomBarItem(
//                 icon: SvgPicture.asset(
//                   IconAssets.shoppingCart.toString(),
//                   colorFilter: const ColorFilter.mode(
//                       kColor.text2Color, BlendMode.srcIn),
//                 ),
//                 selectedIcon: SvgPicture.asset(
//                   IconAssets.shoppingCartFill.toString(),
//                   colorFilter:
//                       const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
//                 ),
//                 title: Text(
//                   'Shop',
//                   style: appStyle(fw: FontWeight.w700, size: 10.sp),
//                 ),
//                 selectedColor: kColor.redColor,
//                 unSelectedColor: kColor.text2Color),
//             BottomBarItem(
//                 icon: SvgPicture.asset(
//                   IconAssets.bag.toString(),
//                   colorFilter: const ColorFilter.mode(
//                       kColor.text2Color, BlendMode.srcIn),
//                 ),
//                 selectedIcon: SvgPicture.asset(
//                   IconAssets.bagFill.toString(),
//                   colorFilter:
//                       const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
//                 ),
//                 title: Text(
//                   'Bag',
//                   style: appStyle(fw: FontWeight.w700, size: 10.sp),
//                 ),
//                 selectedColor: kColor.redColor,
//                 unSelectedColor: kColor.text2Color),
//             BottomBarItem(
//                 icon: SvgPicture.asset(
//                   IconAssets.favourites.toString(),
//                   colorFilter: const ColorFilter.mode(
//                       kColor.text2Color, BlendMode.srcIn),
//                 ),
//                 selectedIcon: SvgPicture.asset(
//                   IconAssets.favouritesFill.toString(),
//                   colorFilter:
//                       const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
//                 ),
//                 title: Text(
//                   'Favorites',
//                   style: appStyle(fw: FontWeight.w700, size: 10.sp),
//                 ),
//                 selectedColor: kColor.redColor,
//                 unSelectedColor: kColor.text2Color),
//             BottomBarItem(
//                 icon: SvgPicture.asset(
//                   IconAssets.profile.toString(),
//                   colorFilter: const ColorFilter.mode(
//                       kColor.text2Color, BlendMode.srcIn),
//                 ),
//                 selectedIcon: SvgPicture.asset(
//                   IconAssets.profileFill.toString(),
//                   colorFilter:
//                       const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
//                 ),
//                 title: Text(
//                   'Profile',
//                   style: appStyle(fw: FontWeight.w700, size: 10.sp),
//                 ),
//                 selectedColor: kColor.redColor,
//                 unSelectedColor: kColor.text2Color),
//           ],
//           hasNotch: false,
//           currentIndex: _currentPage,
//           onTap: (index) {
//             setState(() {
//               _pageController!.jumpToPage(index);
//               selected = index;
//               _currentPage = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/icon_assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/bag_screens/bag_screen.dart';
import 'package:ecommerce_app/view/screens/favorites_screens/favourites_Screen.dart';
import 'package:ecommerce_app/view/screens/home_screens/home_screen.dart';
import 'package:ecommerce_app/view/screens/profile_screens/profile_screen.dart';
import 'package:ecommerce_app/view/screens/shop_screens/shop_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  dynamic selected;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeScreen(),
          ShopScreen(),
          BagScreen(),
          FavoritesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        width: ScreenUtil().scaleWidth,
        height: 83.h,
        decoration: const BoxDecoration(
            color: kColor.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: StylishBottomBar(
          option: AnimatedBarOptions(
            barAnimation: BarAnimation.blink,
            iconStyle: IconStyle.Default,
          ),
          items: [
            BottomBarItem(
                icon: SvgPicture.asset(
                  IconAssets.home.toString(),
                  colorFilter: const ColorFilter.mode(
                      kColor.text2Color, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  IconAssets.homeFill.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
                title: Text(
                  'Home',
                  style: appStyle(fw: FontWeight.w700, size: 10.sp),
                ),
                selectedColor: kColor.redColor,
                unSelectedColor: kColor.text2Color),
            BottomBarItem(
                icon: SvgPicture.asset(
                  IconAssets.shoppingCart.toString(),
                  colorFilter: const ColorFilter.mode(
                      kColor.text2Color, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  IconAssets.shoppingCartFill.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
                title: Text(
                  'Shop',
                  style: appStyle(fw: FontWeight.w700, size: 10.sp),
                ),
                selectedColor: kColor.redColor,
                unSelectedColor: kColor.text2Color),
            BottomBarItem(
                icon: SvgPicture.asset(
                  IconAssets.bag.toString(),
                  colorFilter: const ColorFilter.mode(
                      kColor.text2Color, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  IconAssets.bagFill.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
                title: Text(
                  'Bag',
                  style: appStyle(fw: FontWeight.w700, size: 10.sp),
                ),
                selectedColor: kColor.redColor,
                unSelectedColor: kColor.text2Color),
            BottomBarItem(
                icon: SvgPicture.asset(
                  IconAssets.favourites.toString(),
                  colorFilter: const ColorFilter.mode(
                      kColor.text2Color, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  IconAssets.favouritesFill.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
                title: Text(
                  'Favourites',
                  style: appStyle(fw: FontWeight.w700, size: 10.sp),
                ),
                selectedColor: kColor.redColor,
                unSelectedColor: kColor.text2Color),
            BottomBarItem(
                icon: SvgPicture.asset(
                  IconAssets.profile.toString(),
                  colorFilter: const ColorFilter.mode(
                      kColor.text2Color, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  IconAssets.profileFill.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
                title: Text(
                  'Profile',
                  style: appStyle(fw: FontWeight.w700, size: 10.sp),
                ),
                selectedColor: kColor.redColor,
                unSelectedColor: kColor.text2Color),
          ],
          hasNotch: false,
          currentIndex: selected ?? 0,
          onTap: (index) {
            controller.jumpToPage(index);
            setState(() {
              selected = index;
            });
          },
        ),
      ),
    );
  }
}
