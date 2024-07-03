import 'package:ecommerce_app/controller/provider/favourites_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screens/product_screen.dart';
import 'package:ecommerce_app/view/widgets/favourite_screen_widget/favorite_card_items.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

ListView favoritesListWidget(List<Product> pp) {
  return ListView.builder(
    itemCount: pp.length,
    itemBuilder: (context, index) {
      return Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(product: pp[index]),
                  ));
            },
            child: FavouriteCardItems(
              pp: pp,
              index: index,
            ),
          ),
          //remove button
          Positioned(
              top: 8.h,
              right: 7.w,
              child: IconButton(
                  onPressed: () {
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .removeFavorites(pp[index].id!);
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .retrieveFavorites();
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: kColor.text2Color,
                  ))),

          //checkout button
          // Positioned(
          //     top: 80.h,
          //     right: 0.w,
          //     child: InkWell(
          //       onTap: () {

          //       },
          //       child: Container(
          //         padding: const EdgeInsets.all(20),
          //         decoration: const BoxDecoration(
          //             shape: BoxShape.circle, color: kColor.redColor),
          //         child: SvgPicture.asset(
          //           IconAssets.bagFill.toString(),
          //           colorFilter: const ColorFilter.mode(
          //               kColor.whiteColor, BlendMode.srcIn),
          //         ),
          //       ),
          //     ))
        ],
      );
    },
  );
}
