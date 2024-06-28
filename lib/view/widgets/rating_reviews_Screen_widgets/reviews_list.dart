import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/controller/provider/review_provider.dart';
import 'package:ecommerce_app/view/widgets/rating_reviews_Screen_widgets/reviews_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsList extends StatefulWidget {
  const ReviewsList({
    super.key,
    required this.reviews,
    required this.rate,
    required this.id,
  });
  final double rate;
  final List<String> reviews;
  final String id;
  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<RetrieveProductProvider>(context, listen: false)
        .fetchProducts();
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductReviews(widget.id);
    Provider.of<ReviewProvider>(context, listen: false)
        .fetchProductRating(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:
            widget.reviews.toString() == "[]" ? 0 : widget.reviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(
            review: widget.reviews[index]
                .replaceAll(RegExp(r']'), '')
                .replaceAll(RegExp(r'\['), ''),
            rating: widget.rate,
          );
        },
      ),
    );
  }
}
