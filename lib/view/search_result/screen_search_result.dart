import 'package:ecommerce_ui/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

import '../home/products_view_builder/products_view_builder.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProductListViewBuilder(),
          ],
        ),
      ),
    );
  }
}
