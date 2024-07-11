import 'package:ecommerce_app/view/widgets/home_screen_widgets/fashion_sale_widget.dart';
import 'package:ecommerce_app/view/widgets/home_screen_widgets/new_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FashionSaleWidget(),
              SizedBox(height: 5.h),
              const NewItemsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
