import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStatisticsWidget extends StatelessWidget {
  const RatingStatisticsWidget({
    super.key,
    required this.rating,
    required this.itemCount,
  });
  final double rating;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 0,
          direction: Axis.horizontal,
          ignoreGestures: true,
          itemCount: itemCount,
          itemSize: 20,
          maxRating: rating,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star_rate_rounded,
            color: kColor.ratingColor,
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
