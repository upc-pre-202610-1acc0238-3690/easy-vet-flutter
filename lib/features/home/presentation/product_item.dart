import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Hero(
            tag: product.id,
            child: Image.network(product.image, height: 256),
          ),
          Text(product.name),
        ],
      ),
    );
  }
}
