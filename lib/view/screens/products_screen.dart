import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/product_card_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_list_widget.dart';
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
  bool isPriceLowToHight = false;
  bool isPriceHighToLow = false;
  late List<Product> sortedProducts;
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kColor.textColor,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: kColor.textColor,
                ))
          ],
          centerTitle: true,
          title: Text(
            "${widget.gender[0].toUpperCase() + widget.gender.substring(1)}'s ${widget.subcat == "cardigansAndSweaters" ? "Cardigans & Sweaters" : widget.subcat == "shirtsAndBlouses" ? "Shirts & Blouses" : widget.subcat}",
            style: appStyle(
                fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  children: [
                    const TagsListWidget(),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.filter_list_rounded,
                              color: kColor.textColor,
                            ),
                          ),
                          Text(
                            " Filters",
                            style: appStyle(
                                fw: FontWeight.w500,
                                size: 14.sp,
                                color: kColor.textColor),
                          ),
                        ]),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.swap_vert,
                              color: kColor.textColor,
                            ),
                          ),
                          Text(
                            " Price: lowest to high",
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
              ),
              SizedBox(height: 16.h),
              Provider.of<RetrieveProductProvider>(context, listen: true)
                      .isLoading
                  ? Center(
                      child: Column(
                      children: [
                        SizedBox(height: 160.h),
                        const CircularProgressIndicator(
                          color: kColor.redColor,
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
                              'error fetching products',
                              style: appStyle(
                                  fw: FontWeight.bold,
                                  size: 20.sp,
                                  color: kColor.textColor),
                            ),
                          ],
                        ))
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 2 / 4),
                            itemCount: Provider.of<RetrieveProductProvider>(
                                    context,
                                    listen: true)
                                .products
                                .where((e) =>
                                    e.gender == widget.gender &&
                                    e.category == widget.cat &&
                                    e.subcategory == widget.subcat)
                                .length,
                            itemBuilder: (context, index) {
                              final product =
                                  Provider.of<RetrieveProductProvider>(context,
                                          listen: true)
                                      .products
                                      .where((e) =>
                                          e.gender == widget.gender &&
                                          e.category == widget.cat &&
                                          e.subcategory == widget.subcat)
                                      .toList()[index];
                              return ProductCard(
                                  image: product.image,
                                  isFavourited: false,
                                  rating: product.rating,
                                  reviews: product.reviews[0].substring(1,
                                              product.reviews[0].length - 1) ==
                                          ""
                                      ? 0
                                      : product.reviews.length,
                                  name: product.name,
                                  price: product.price.toString(),
                                  store: product.store);
                            },
                          ),
                        ),
            ],
          ),
        ));
  }

//================================================================//================================================================
//Filter method
  Future<dynamic> filter() {
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
}
