import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/view/widgets/profile_screen/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final Map<String, dynamic> order;
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
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
        backgroundColor: kColor.whiteColor,
        elevation: 0,
        title: Text(
          "Order Details",
          style: appStyle(
              fw: FontWeight.w500, size: 18.sp, color: kColor.textColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            OrderItemCard(order: widget.order)
          ],
        ),
      ),
    );
  }
}
