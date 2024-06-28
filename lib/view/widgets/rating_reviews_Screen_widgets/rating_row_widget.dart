import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/view/screens/rating_reviews_screnn.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/ratign_container_widget.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/rating_Statistics.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/rating_no_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RatingRowWidget extends StatelessWidget {
  const RatingRowWidget({
    super.key,
    required this.widget,
  });

  final RatingAndReviewsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Provider.of<ReviewProvider>(context, listen: true).rating}",
              style: appStyle(
                  fw: FontWeight.w600, size: 44.sp, color: kColor.textColor),
            ),
            Text(
              "\n23 ratings",
              style: appStyle(
                  fw: FontWeight.w500, size: 14.sp, color: kColor.text2Color),
            )
          ],
        ),
        SizedBox(width: 28.w),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RatingStatisticsWidget(itemCount: 5, rating: 5),
            RatingStatisticsWidget(itemCount: 4, rating: 4),
            RatingStatisticsWidget(itemCount: 3, rating: 3),
            RatingStatisticsWidget(itemCount: 2, rating: 2),
            RatingStatisticsWidget(itemCount: 1, rating: 1),
          ],
        ),
        SizedBox(width: 8.w),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingContainer(width: 114),
            RatingContainer(width: 40),
            RatingContainer(width: 29),
            RatingContainer(width: 15),
            RatingContainer(width: 9),
          ],
        ),
        SizedBox(width: 8.w),
        const Column(
          children: [
            RatingNumber(no: "12"),
            RatingNumber(no: "5"),
            RatingNumber(no: "4"),
            RatingNumber(no: "2"),
            RatingNumber(no: "0"),
          ],
        )
      ],
    );
  }
}
