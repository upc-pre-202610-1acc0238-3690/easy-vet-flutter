import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              context.read<CartViewModel>().addToCart(product.id, 1);
            },
            child: Text('Add to cart'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: product.id,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return const Icon(Icons.broken_image);
              },
            ),
          ),
          Text(product.name),
        ],
      ),
    );
  }
}
