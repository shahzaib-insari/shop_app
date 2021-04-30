import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products.dart';

import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  //Products productsData;
  //List<Product> products;
  @override
  Widget build(BuildContext context) {
    //productsData = Provider.of<Products>(context);
    //products ??= productsData.items;

    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (c) => products[i],
        child: ProductItem(),
      ),
    );
  }
}
