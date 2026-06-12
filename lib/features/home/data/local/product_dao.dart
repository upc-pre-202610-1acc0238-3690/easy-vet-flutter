import 'package:easy_vet/core/database/app_database.dart';
import 'package:easy_vet/features/home/data/local/product_entity.dart';

class ProductDao {
  final AppDatabase appDatabase;

  const ProductDao({required this.appDatabase});

  Future<void> insertProduct(ProductEntity product) async {
    final db = await appDatabase.database;
    await db.insert('products', product.toMap());
  }

  Future<void> deleteProduct(int id) async {
    final db = await appDatabase.database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllProducts() async {
    final db = await appDatabase.database;
    await db.delete('products');
  }

  Future<List<ProductEntity>> getProducts() async {
    final db = await appDatabase.database;
    final List maps = await db.query('products');

    return maps.map((map) => ProductEntity.fromMap(map)).toList();
  }
}
