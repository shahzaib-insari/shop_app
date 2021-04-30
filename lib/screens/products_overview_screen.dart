import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  Products productData;
  List<Product> products;
  @override
  Widget build(BuildContext context) {
    productData = Provider.of<Products>(context);
    products ??= productData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(
            products[i].id,
            products[i].title,
            products[i].description,
            products[i].price,
            products[i].imageUrl,
            products[i].isFavorite),
      ),
    );
  }
}
