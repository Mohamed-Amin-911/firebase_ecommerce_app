import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/image_Assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_user_info_provider.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/screens/bag_screens/change_address_screen.dart';
import 'package:ecommerce_app/view/screens/bag_screens/change_card_screen.dart';
import 'package:ecommerce_app/view/screens/profile_screens/my_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        body: Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColor.whiteColor,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Text(
                "My profile",
                style: appStyle(
                    fw: FontWeight.w600, size: 34.sp, color: kColor.textColor),
              ),
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    user.image == null ? KImageAssets.user : user.image!,
                    width: 64.w,
                    height: 64.h,
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        user.name,
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 18.sp,
                            color: kColor.textColor),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        user.email,
                        style: appStyle(
                            fw: FontWeight.w600,
                            size: 14.sp,
                            color: kColor.text2Color),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 7.h),
              ProfileItemCard(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyOrdersScreen(),
                      ));
                },
                title: "My orders",
                subtitle: "Already have ${user.orders.length} orders",
              ),
              ProfileItemCard(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeAddressScreen(),
                      ));
                },
                title: "Shipping addresses",
                subtitle: "${user.shippingAddress.length} addresses",
              ),
              ProfileItemCard(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeCardScreen(),
                      ));
                },
                title: "Payment methods",
                subtitle: user.defaultCard.isEmpty
                    ? "No payment method"
                    : '${user.defaultCard["cardNumber"][0] == "5" || user.defaultCard["cardNumber"][0] == "2" ? "Mastercard" : "Visa"} **${user.defaultCard["cardNumber"].substring(user.defaultCard["cardNumber"].length - 2)}',
              ),
              ProfileItemCard(
                function: () {},
                title: "Promocodes",
                subtitle: "You have special promocodes",
              ),
              ProfileItemCard(
                function: () {},
                title: "My reviews",
                subtitle: "Reviews for 4 items",
              ),
              ProfileItemCard(
                function: () {},
                title: "Settings",
                subtitle: "Notifications, password",
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    super.key,
    required this.function,
    required this.title,
    required this.subtitle,
  });
  final void Function() function;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: appStyle(
                      fw: FontWeight.w600,
                      size: 16.sp,
                      color: kColor.textColor),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 11.sp,
                      color: kColor.text2Color),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: kColor.text2Color,
            )
          ],
        ),
      ),
    );
  }
}
