import 'package:ecommerce_app/view/widgets/products_screen_widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class TagsListWidget extends StatelessWidget {
  const TagsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TagWidget(name: "T-shirts"),
          TagWidget(name: "Crop tops"),
          TagWidget(name: "Blouses"),
          TagWidget(name: "Shirts"),
        ],
      ),
    );
  }
}
