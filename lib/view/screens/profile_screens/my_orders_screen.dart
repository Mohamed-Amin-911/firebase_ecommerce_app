import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_user_info_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/widgets/profile_screen/order_card.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int tab = 1;
  @override
  void initState() {
    super.initState();

    Provider.of<RetrieveUserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final Userr user =
        Provider.of<RetrieveUserProvider>(context, listen: true).user;
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            Text(
              "My Orders",
              style: appStyle(
                  fw: FontWeight.w600, size: 34.sp, color: kColor.textColor),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      tab = 1;
                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: tab == 1 ? kColor.textColor : kColor.whiteColor,
                        borderRadius: BorderRadius.circular(29.r)),
                    child: Center(
                      child: Text(
                        "Processing",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: tab == 1
                                ? kColor.whiteColor
                                : kColor.textColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      tab = 2;
                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: tab == 2 ? kColor.textColor : kColor.whiteColor,
                        borderRadius: BorderRadius.circular(29.r)),
                    child: Center(
                      child: Text(
                        "Delivered",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: tab == 2
                                ? kColor.whiteColor
                                : kColor.textColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      tab = 3;
                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: tab == 3 ? kColor.textColor : kColor.whiteColor,
                        borderRadius: BorderRadius.circular(29.r)),
                    child: Center(
                      child: Text(
                        "Cancelled",
                        style: appStyle(
                            fw: FontWeight.w500,
                            size: 14.sp,
                            color: tab == 3
                                ? kColor.whiteColor
                                : kColor.textColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            tab == 1
                ? Expanded(
                    child: ListView.builder(
                    itemCount: user.orders.length,
                    itemBuilder: (context, index) =>
                        OrderCard(order: user.orders[index]),
                  ))
                : Container()
          ],
        ),
      ),
    );
  }
}
