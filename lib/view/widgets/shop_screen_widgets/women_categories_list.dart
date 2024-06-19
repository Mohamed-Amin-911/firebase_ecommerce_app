import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/view/screens/sub_category_screen.dart';
import 'package:ecommerce_app/view/widgets/shop_screen_widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WomenCategoriesList extends StatelessWidget {
  const WomenCategoriesList({
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
                image: KImageAssets.womanNew,
                name: "New",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen()));
                },
              ),
              CategoryCardWidget(
                image: KImageAssets.womanClothes,
                name: "Clothes",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategoryScreen()));
                },
              ),
              const CategoryCardWidget(
                image: KImageAssets.womanShoes,
                name: "Shoes",
              ),
              const CategoryCardWidget(
                image: KImageAssets.womanAccesories,
                name: "Accesories",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
