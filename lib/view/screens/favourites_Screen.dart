import 'package:ecommerce_app/constants/icon_assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/favourites_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screen.dart';
import 'package:ecommerce_app/view/widgets/favourite_screen_widget/favorite_card_items.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final searchController = TextEditingController();
  bool isPriceLowToHight = false;
  bool isPriceHighToLow = false;
  late List<String> productIds;
  late List<Product> sortedProducts;
  bool isSearching = false;
  final List<Product> pp = [];
  @override
  void initState() {
    super.initState();
    Provider.of<FavoritesProvider>(context, listen: false).retrieveFavorites();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: kColor.whiteColor,
        //   elevation: 0,
        //   // leading: Container(),
        //   // actions: [
        //   //   IconButton(
        //   //       onPressed: () {
        //   //         setState(() {
        //   //           isSearching = !isSearching;
        //   //         });
        //   //       },
        //   //       icon: const Icon(
        //   //         Icons.search_rounded,
        //   //         color: kColor.textColor,
        //   //       ))
        //   // ],
        //   centerTitle: true,
        //   title: isSearching
        //       ? SearchWidget(searchController: searchController)
        //       : Container(),
        // ),

        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          //tags and filters
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(144, 155, 155, 155),
                  blurRadius: 30,
                  spreadRadius: 22,
                  offset: Offset(0, -10))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favorites",
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 34.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 5.h),
                const TagsListWidget(),
                SizedBox(height: 5.h),
                //filters row
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     FavFiltersWidget(widget: widget),
                //     Row(children: [
                //       InkWell(
                //         onTap: () {
                //           setState(() {
                //             sort();
                //           });
                //         },
                //         child: const Icon(
                //           Icons.swap_vert,
                //           color: kColor.textColor,
                //         ),
                //       ),
                //       Text(
                //         isPriceLowToHight && !isPriceHighToLow
                //             ? " Price: lowest to high"
                //             : !isPriceLowToHight && isPriceHighToLow
                //                 ? " Price: highest to low"
                //                 : " sort by price",
                //         style: appStyle(
                //             fw: FontWeight.w500,
                //             size: 14.sp,
                //             color: kColor.textColor),
                //       ),
                //     ]),
                //     InkWell(
                //       onTap: () {},
                //       child: const Icon(
                //         Icons.view_list_rounded,
                //         color: kColor.textColor,
                //       ),
                //     ),
                //   ],
                // ),

                // SizedBox(height: 16.h),
              ],
            ),
          ),
          // SizedBox(height: 19.h),
          Provider.of<FavoritesProvider>(context, listen: true).isLoading
              ? Center(
                  child: Column(
                  children: [
                    SizedBox(height: 160.h),
                    const CircularProgressIndicator(
                      color: kColor.redColor,
                    ),
                  ],
                ))
              : FutureBuilder(
                  future: Provider.of<FavoritesProvider>(context, listen: false)
                      .getProductsFromFavs(Provider.of<RetrieveProductProvider>(
                              context,
                              listen: false)
                          .products),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Product> pp = snapshot.data!;
                      return Expanded(
                          child: ListView.builder(
                        itemCount: pp.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductScreen(product: pp[index]),
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
                                        Provider.of<FavoritesProvider>(context,
                                                listen: false)
                                            .removeFavorites(pp[index].id!);
                                        Provider.of<FavoritesProvider>(context,
                                                listen: false)
                                            .retrieveFavorites();
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        color: kColor.text2Color,
                                      ))),

                              //checkout button
                              Positioned(
                                  top: 80.h,
                                  right: 0.w,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kColor.redColor),
                                      child: SvgPicture.asset(
                                        IconAssets.bagFill.toString(),
                                        colorFilter: const ColorFilter.mode(
                                            kColor.whiteColor, BlendMode.srcIn),
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        },
                      ));
                    } else {
                      return Center(
                          child: Column(
                        children: [
                          SizedBox(height: 160.h),
                          Text(
                            'No favorites',
                            style: appStyle(
                                fw: FontWeight.bold,
                                size: 20.sp,
                                color: kColor.textColor),
                          ),
                        ],
                      ));
                    }
                  },
                )
        ],
      ),
    ));
  }

//================================================================//================================================================
//Filter method
  Future<dynamic> sort() {
    return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: kColor.whiteColor,
      elevation: 10,
      enableDrag: true,
      barrierColor: const Color.fromARGB(94, 78, 78, 78),
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          enableDrag: true,
          onClosing: () {},
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (BuildContext context, setState) {
              return Container(
                height: 300.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34))),
                child: Column(
                  children: [
                    SizedBox(height: 13.h),
                    Container(
                      height: 6.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: kColor.text2Color,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 13.h),
                        Text(
                          "Sort by",
                          style: appStyle(fw: FontWeight.w600, size: 18.sp)
                              .copyWith(color: kColor.textColor),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                            height: 48.h,
                            width: double.infinity.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: isPriceLowToHight
                                      ? kColor.redColor
                                      : kColor.whiteColor,
                                  shape: const ContinuousRectangleBorder()),
                              onPressed: () {
                                setState(() {
                                  isPriceLowToHight = true;
                                  isPriceHighToLow = false;
                                  Provider.of<RetrieveProductProvider>(context,
                                          listen: false)
                                      .sortByPriceAscending();
                                });
                              },
                              child: Text(
                                "Price: lowest to high",
                                style:
                                    appStyle(fw: FontWeight.w600, size: 16.sp)
                                        .copyWith(
                                            color: isPriceLowToHight
                                                ? kColor.whiteColor
                                                : kColor.textColor),
                              ),
                            )),
                        SizedBox(
                            height: 48.h,
                            width: double.infinity.w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: isPriceHighToLow
                                      ? kColor.redColor
                                      : kColor.whiteColor,
                                  shape: const ContinuousRectangleBorder()),
                              onPressed: () {
                                setState(() {
                                  isPriceHighToLow = true;
                                  isPriceLowToHight = false;
                                  Provider.of<RetrieveProductProvider>(context,
                                          listen: false)
                                      .sortByPriceDescending();
                                });
                              },
                              child: Text(
                                "Price: highest to low",
                                style:
                                    appStyle(fw: FontWeight.w600, size: 16.sp)
                                        .copyWith(
                                            color: isPriceHighToLow
                                                ? kColor.whiteColor
                                                : kColor.textColor),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    );
  }

// void sortByPriceAscending() {
//     _products.sort((a, b) => a.price.compareTo(b.price));
//     notifyListeners();
//   }

//   void sortByPriceDescending() {
//     _products.sort((a, b) => b.price.compareTo(a.price));
//     notifyListeners();
//   }

//   searchProducts(String searchTerm) {
//     final lowercaseSearchTerm =
//         searchTerm.toLowerCase(); // Make search case-insensitive
//     final filteredList = products
//         .where((product) =>
//             product.name.toLowerCase().contains(lowercaseSearchTerm) ||
//             product.category.toLowerCase().contains(lowercaseSearchTerm) ||
//             product.subcategory.toLowerCase().contains(lowercaseSearchTerm) ||
//             product.gender.toLowerCase().contains(lowercaseSearchTerm) ||
//             product.store.toLowerCase().contains(lowercaseSearchTerm))
//         .toList();
//     _products.clear();
//     _products.addAll(filteredList);
//     notifyListeners();
//   }

//   void filterProducts() {
//     List<Product> filteredProducts = _products
//         .where((product) =>
//             (_selectedColors.isEmpty ||
//                 _selectedColors
//                     .any((color) => product.colors.contains(color))) &&
//             product.price >= _minPrice &&
//             product.price <= _maxPrice)
//         .toList();
//     _products.clear();
//     _products.addAll(filteredProducts);
//     notifyListeners();
//   }
}
