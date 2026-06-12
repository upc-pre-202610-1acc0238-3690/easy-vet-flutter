import 'package:easy_vet/features/home/domain/product.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final int stock;
  final double rating;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.stock,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'stock': stock,
      'rating': rating,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'],
      stock: map['stock'],
      rating: map['rating'],
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      image: image,
      stock: stock,
      rating: rating,
    );
  }
}