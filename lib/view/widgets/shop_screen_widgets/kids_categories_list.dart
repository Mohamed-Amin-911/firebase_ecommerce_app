import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/view/screens/shop_screens/sub_category_screen.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KidsCategoriesList extends StatelessWidget {
  const KidsCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.6.h),
        child: IntrinsicHeight(
          child: Column(
            children: [
              CategoryCardWidget(
                image: KImageAssets.kidsNew,
                name: "New",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "neww", gender: "kids")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.kidsClothes,
                name: "Clothes",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "clothes", gender: "kids")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.kidsShoes,
                name: "Shoes",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "shoes", gender: "kids")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.kidsAccesories,
                name: "Accesories",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "accesories", gender: "kids")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
