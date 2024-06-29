import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/view/widgets/bag_screen_widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<CartProvider>(context, listen: false).fetchCart();
    Provider.of<CartProvider>(context, listen: false).getProductsFromFavs(
        Provider.of<RetrieveProductProvider>(context, listen: false).products);
  }

  @override
  Widget build(BuildContext context) {
    // final List<Product> products =
    //     Provider.of<CartProvider>(context, listen: true).products;
    final List<Map<String, String>> cartItems =
        Provider.of<CartProvider>(context, listen: true).items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor.whiteColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kColor.textColor,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            Text("My Bag",
                style: appStyle(
                    fw: FontWeight.w600, size: 34.sp, color: kColor.textColor)),
            SizedBox(height: 18.h),
            Provider.of<RetrieveProductProvider>(context, listen: true)
                    .isLoading
                ?
                //if data is loading
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 160.h),
                      const Center(
                        child: CircularProgressIndicator(
                          color: kColor.textColor,
                        ),
                      )
                    ],
                  )
                : cartItems.isEmpty
                    ?
                    //if list is empty
                    Center(
                        child: Text("No items in your bag",
                            style: appStyle(
                                fw: FontWeight.w600,
                                size: 34.sp,
                                color: kColor.textColor)),
                      )
                    :
                    //listview
                    Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return cartItemCard(
                                Provider.of<RetrieveProductProvider>(context,
                                        listen: true)
                                    .products
                                    .firstWhere((product) =>
                                        product.id == cartItems[index]["id"]),
                                cartItems[index],
                                context);
                          },
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
