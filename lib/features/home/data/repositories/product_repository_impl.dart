import 'package:easy_vet/features/home/data/local/product_dao.dart';
import 'package:easy_vet/features/home/data/local/product_entity.dart';
import 'package:easy_vet/features/home/data/remote/product_dto.dart';
import 'package:easy_vet/features/home/data/remote/product_service.dart';
import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;
  final ProductDao dao;

  const ProductRepositoryImpl({required this.service, required this.dao});

  @override
  Future<List<Product>> getProducts() async {
    List<ProductEntity> entities = await dao.getProducts();
    return entities.map((entity) => entity.toDomain()).toList();
  }

  @override
  Future<void> syncProducts() async {
    await dao.deleteAllProducts();
    List<ProductDto> dtos = await service.getProducts();
    for (var dto in dtos) {
      ProductEntity entity = ProductEntity(
        id: dto.id,
        name: dto.title,
        description: dto.description,
        price: dto.price,
        image: dto.image,
        stock: dto.stock,
        rating: dto.rating,
      );
      await dao.insertProduct(entity);
    }
  }
}
