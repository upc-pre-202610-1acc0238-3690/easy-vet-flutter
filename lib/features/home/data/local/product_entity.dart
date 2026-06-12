import 'package:easy_vet/features/home/domain/product.dart';

class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'],
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      image: image,
    );
  }
}