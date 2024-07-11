import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/cart_provider.dart';
import 'package:ecommerce_app/controller/provider/promoCode_provider.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view/screens/product_screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Padding cartItemCard(Product product, Map<String, dynamic> cartItem,
    BuildContext context, List<Product> prods) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20.h),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(product: product),
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: product.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 104.h,
              width: 104.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 11.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: appStyle(
                    fw: FontWeight.w500, size: 16.sp, color: kColor.textColor),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    "Color: ",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 12.sp,
                        color: kColor.text2Color),
                  ),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: kColor.text2Color, width: 2),
                        shape: BoxShape.circle,
                        color: Color(int.parse(cartItem["color"].toString()))),
                  ),
                  SizedBox(width: 13.w),
                  Text(
                    "Size: ",
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 12.sp,
                        color: kColor.text2Color),
                  ),
                  Text(
                    cartItem["size"].toString(),
                    style: appStyle(
                        fw: FontWeight.w500,
                        size: 14.sp,
                        color: kColor.textColor),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              SizedBox(
                width: 200.w,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          int quantity = int.parse(cartItem["quantity"]!);
                          quantity--;
                          if (quantity == 0) {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeFromCart(cartItem);
                            Provider.of<CartProvider>(context, listen: false)
                                .getProductsFromFavs(prods);
                            Provider.of<CartProvider>(context, listen: false)
                                .fetchCart(
                              Provider.of<RetrieveProductProvider>(context,
                                      listen: false)
                                  .products,
                            );

                            Provider.of<PromoCodePRovider>(context,
                                    listen: false)
                                .setDiscount(0);
                            Provider.of<PromoCodePRovider>(context,
                                    listen: false)
                                .setPromoCode("");
                          } else {
                            Provider.of<CartProvider>(context, listen: false)
                                .changeQuantity(
                                    cartItem["price"]!,
                                    cartItem["id"]!,
                                    cartItem["color"]!,
                                    quantity,
                                    cartItem["size"]!,
                                    prods);
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: kColor.text2Color,
                        )),
                    Text(
                      " ${cartItem["quantity"]} ",
                      style: appStyle(
                          fw: FontWeight.w500,
                          size: 16.sp,
                          color: kColor.textColor),
                    ),
                    IconButton(
                        onPressed: () {
                          int quantity = int.parse(cartItem["quantity"]!);
                          quantity++;
                          Provider.of<CartProvider>(context, listen: false)
                              .changeQuantity(
                                  cartItem["price"]!,
                                  cartItem["id"]!,
                                  cartItem["color"]!,
                                  quantity,
                                  cartItem["size"]!,
                                  prods);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: kColor.text2Color,
                        )),
                    const Spacer(),
                    Text(
                      "${product.price.toInt().toString()}\$",
                      style: appStyle(
                          fw: FontWeight.w600,
                          size: 16.sp,
                          color: kColor.textColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.more_vert_rounded,
          //         color: kColor.text2Color)),
        ],
      ),
    ),
  );
}
