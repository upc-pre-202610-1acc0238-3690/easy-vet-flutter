import 'package:easy_vet/features/home/domain/product.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_state.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final ProductRepository repository;

  HomeViewModel({required this.repository}) {
    loadProducts();
    syncProducts();
  }

  HomeState state = HomeState();

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      List<Product> products = await repository.getProducts();
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      String errorMessage = 'Failed to load products: $e';
      state = state.copyWith(errorMessage: errorMessage, isLoading: false);
    }
    notifyListeners();
  }

  Future<void> syncProducts() async {
    try {
      await repository.syncProducts();
    } catch (e) {
      String errorMessage = 'Failed to sync products: $e';
      state = state.copyWith(errorMessage: errorMessage);
    }
    notifyListeners();
  }
}
