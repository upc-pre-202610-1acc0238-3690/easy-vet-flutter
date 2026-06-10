import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:easy_vet/features/cart/data/cart_service.dart';
import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;

  const CartRepositoryImpl({required this.service});
  @override
  Future<void> addToCart(int productId, int quantity) {
    throw UnimplementedError();
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final List<CartItemDto> dtos = await service.getCartItems();
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
