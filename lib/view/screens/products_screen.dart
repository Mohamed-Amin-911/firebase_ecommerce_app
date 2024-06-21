import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/product_card_widget.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/tags_and_filters_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();

    super.initState();
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
            "Women's tops",
            style: appStyle(
                fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TagsAndFiltersWidget(),
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
                                    listen: false)
                                .products
                                .length,
                            itemBuilder: (context, index) {
                              final product =
                                  Provider.of<RetrieveProductProvider>(context,
                                          listen: false)
                                      .products[index];
                              return ProductCard(
                                  image: product.image,
                                  isFavourited: false,
                                  rating: product.rating,
                                  reviews: product.reviews.length,
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
}
