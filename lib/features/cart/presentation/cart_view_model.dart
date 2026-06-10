import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';
import 'package:easy_vet/features/cart/presentation/cart_state.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  CartState state = CartState();

  final CartRepository repository;

  CartViewModel({required this.repository}) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: false);
    notifyListeners();

    try {
      final List<CartItem> items = await repository.getCartItems();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: "$e", isLoading: false);
    }
    notifyListeners();
  }
}
