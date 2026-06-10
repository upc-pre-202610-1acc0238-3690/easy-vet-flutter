import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/auth/data/auth_repository_impl.dart';
import 'package:easy_vet/features/auth/data/auth_service.dart';
import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/presentation/login_view_model.dart';
import 'package:easy_vet/features/cart/data/cart_repository_impl.dart';
import 'package:easy_vet/features/cart/data/cart_service.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';
import 'package:easy_vet/features/cart/presentation/cart_view_model.dart';
import 'package:easy_vet/features/home/data/product_repository_impl.dart';
import 'package:easy_vet/features/home/data/product_service.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerLazySingleton<ProductService>(() => ProductService());

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(service: getIt<ProductService>()),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(repository: getIt<ProductRepository>()),
  );

  getIt.registerLazySingleton<AuthService>(() => AuthService());

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<TokenStorage>(
    () => TokenStorage(storage: getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      service: getIt<AuthService>(),
      tokenStorage: getIt<TokenStorage>(),
    ),
  );

  getIt.registerFactory<LoginViewModel>(
    () => LoginViewModel(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<CartService>(
    () => CartService(storage: getIt<TokenStorage>()),
  );

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(service: getIt<CartService>()),
  );

  getIt.registerFactory<CartViewModel>(
    () => CartViewModel(repository: getIt<CartRepository>()),
  );
}
