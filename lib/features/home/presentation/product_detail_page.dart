import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, required this.product});
  final Product product;

  final ValueNotifier<int> quantity = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: () {
              context.read<CartViewModel>().addToCart(
                product.id,
                quantity.value,
              );
            },
            child: Text('Add to cart'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Implement favorite functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              product.name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(product.rating.toStringAsFixed(1)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity.value > 1) {
                      quantity.value--;
                    }
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: quantity,
                  builder: (context, value, child) {
                    return Text(value.toString());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    quantity.value++;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
