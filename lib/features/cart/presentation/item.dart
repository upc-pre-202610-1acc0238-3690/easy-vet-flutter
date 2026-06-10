import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(item.image, width: 64, height: 64, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Quantity: ${item.quantity}"),
                Text("\$ ${item.price}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
