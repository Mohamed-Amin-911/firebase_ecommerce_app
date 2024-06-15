import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/icon_assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/view/screens/bag_screen.dart';
import 'package:ecommerce_app/view/screens/favourites_Screen.dart';
import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:ecommerce_app/view/screens/profile_screen.dart';
import 'package:ecommerce_app/view/screens/shop_screen.dart';
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
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomeScreen(),
          const ShopScreen(),
          const BagScreen(),
          const FavouritesScreen(),
          const ProfileScreen(),
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
