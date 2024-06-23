import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:ecommerce_app/view/screens/products_screen.dart';
import 'package:ecommerce_app/view/widgets/products_screen_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsDisplayWidget extends StatelessWidget {
  const ProductsDisplayWidget({
    super.key,
    required this.widget,
  });

  final ProductsScreen widget;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2 / 4),
      itemCount: Provider.of<RetrieveProductProvider>(context, listen: true)
          .products
          .where((e) =>
              e.gender == widget.gender &&
              e.category == widget.cat &&
              e.subcategory == widget.subcat)
          .toList()
          .where((product) =>
              product.name.toLowerCase().contains(Provider.of<RetrieveProductProvider>(context, listen: true).searchedChar.toLowerCase()) ||
              product.category.toLowerCase().contains(
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .searchedChar
                      .toLowerCase()) ||
              product.subcategory.toLowerCase().contains(
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .searchedChar
                      .toLowerCase()) ||
              product.gender.toLowerCase().contains(
                  Provider.of<RetrieveProductProvider>(context, listen: true)
                      .searchedChar
                      .toLowerCase()) ||
              product.store.toLowerCase().contains(Provider.of<RetrieveProductProvider>(context, listen: true).searchedChar.toLowerCase()))
          .toList()
          .length,
      itemBuilder: (context, index) {
        final product = Provider.of<RetrieveProductProvider>(context, listen: true)
            .products
            .where((e) =>
                e.gender == widget.gender &&
                e.category == widget.cat &&
                e.subcategory == widget.subcat)
            .toList()
            .where((product) =>
                product.name.toLowerCase().contains(Provider.of<RetrieveProductProvider>(context, listen: true).searchedChar.toLowerCase()) ||
                product.category.toLowerCase().contains(
                    Provider.of<RetrieveProductProvider>(context, listen: true)
                        .searchedChar
                        .toLowerCase()) ||
                product.subcategory.toLowerCase().contains(
                    Provider.of<RetrieveProductProvider>(context, listen: true)
                        .searchedChar
                        .toLowerCase()) ||
                product.gender.toLowerCase().contains(
                    Provider.of<RetrieveProductProvider>(context, listen: true)
                        .searchedChar
                        .toLowerCase()) ||
                product.store.toLowerCase().contains(Provider.of<RetrieveProductProvider>(context, listen: true).searchedChar.toLowerCase()))
            .toList()[index];
        return ProductCard(
            image: product.image,
            isFavourited: false,
            rating: product.rating,
            reviews: product.reviews[0]
                        .substring(1, product.reviews[0].length - 1) ==
                    ""
                ? 0
                : product.reviews.length,
            name: product.name,
            price: product.price.toString(),
            store: product.store);
      },
    );
  }
}
