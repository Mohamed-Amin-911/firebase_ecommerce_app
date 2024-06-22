import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/view/screens/sub_category_screen.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenCategoriesList extends StatelessWidget {
  const MenCategoriesList({
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
                image: KImageAssets.menNew,
                name: "New",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "neww", gender: "men")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.menClothes,
                name: "Clothes",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "clothes", gender: "men")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.menShoes,
                name: "Shoes",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "shoes", gender: "men")));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.menAccesories,
                name: "Accesories",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen(
                              cat: "accesories", gender: "men")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
