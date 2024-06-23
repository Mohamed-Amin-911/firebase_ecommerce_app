import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/controller/provider/retrieve_products_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: kColor.textColor,
      decoration: InputDecoration(
        hintText: 'search for a product',
        border: InputBorder.none,
        hintStyle:
            appStyle(fw: FontWeight.w400, size: 14, color: kColor.text2Color),
      ),
      style: appStyle(color: kColor.textColor, size: 18, fw: FontWeight.w500),
      onChanged: (searchedCharacter) {
        searchedCharacter == ""
            ? Provider.of<RetrieveProductProvider>(context, listen: false)
                .fetchProducts()
            : Provider.of<RetrieveProductProvider>(context, listen: false)
                .searchProducts(searchedCharacter);
      },
    );
  }
}
