import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/filter_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/products_display_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/search_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/sort_method.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(
      {super.key,
      required this.gender,
      required this.subcat,
      required this.cat});
  final String gender;
  final String cat;
  final String subcat;
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final searchController = TextEditingController();
  bool isPriceLowToHight = false;
  bool isPriceHighToLow = false;
  late List<Product> sortedProducts;
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    sortedProducts =
        Provider.of<RetrieveProductProvider>(context, listen: false)
            .products
            .where((e) =>
                e.gender == widget.gender &&
                e.category == widget.cat &&
                e.subcategory == widget.subcat)
            .toList();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColor.whiteColor,
          elevation: 0,
          leading: isSearching
              ? Container()
              : IconButton(
                  onPressed: () {
                    Provider.of<RetrieveProductProvider>(context, listen: false)
                        .setSearchedChar("");
                    Provider.of<RetrieveProductProvider>(context, listen: false)
                        .setMaxPrice(1500);
                    Provider.of<RetrieveProductProvider>(context, listen: false)
                        .setMinPrice(10);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: kColor.textColor,
                  )),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: kColor.textColor,
                ))
          ],
          centerTitle: true,
          title: isSearching
              ? SearchWidget(searchController: searchController)
              : ProductsScreenTitle(widget: widget),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //tags and filters
              tagsAndFiltersWidget(context),

              SizedBox(height: 19.h),
              Provider.of<RetrieveProductProvider>(context, listen: true)
                      .isLoading
                  ? Center(
                      child: Column(
                      children: [
                        SizedBox(height: 160.h),
                        const CircularProgressIndicator(
                          color: kColor.textColor,
                        ),
                      ],
                    ))
                  : Provider.of<RetrieveProductProvider>(context, listen: true)
                          .products
                          .where((e) =>
                              e.gender == widget.gender &&
                              e.category == widget.cat &&
                              e.subcategory == widget.subcat)
                          .isEmpty
                      ? Center(
                          child: Column(
                          children: [
                            SizedBox(height: 160.h),
                            Text(
                              'No products',
                              style: appStyle(
                                  fw: FontWeight.w400,
                                  size: 20.sp,
                                  color: kColor.textColor),
                            ),
                          ],
                        ))
                      : Expanded(
                          child: ProductsDisplayWidget(widget: widget),
                        ),
            ],
          ),
        ));
  }

  Container tagsAndFiltersWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Color.fromARGB(144, 155, 155, 155),
            blurRadius: 30,
            spreadRadius: 22,
            offset: Offset(0, -10))
      ]),
      child: Column(
        children: [
          const TagsListWidget(),
          SizedBox(height: 20.h),
          //filters row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FiltersWidget(widget: widget),
              Row(children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      sort(context, isPriceHighToLow, isPriceHighToLow);
                    });
                  },
                  child: const Icon(
                    Icons.swap_vert,
                    color: kColor.textColor,
                  ),
                ),
                Text(
                  isPriceLowToHight && !isPriceHighToLow
                      ? " Price: lowest to high"
                      : !isPriceLowToHight && isPriceHighToLow
                          ? " Price: highest to low"
                          : " sort by price",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 14.sp,
                      color: kColor.textColor),
                ),
              ]),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.view_list_rounded,
                  color: kColor.textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
