import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(tag: product.id, child: Image.network(product.image)),
          Text(product.name),
        ],
      ),
    );
  }
}
