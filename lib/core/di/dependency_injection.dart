import 'package:easy_vet/features/auth/data/auth_repository_impl.dart';
import 'package:easy_vet/features/auth/data/auth_service.dart';
import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/presentation/login_view_model.dart';
import 'package:easy_vet/features/home/data/product_repository_impl.dart';
import 'package:easy_vet/features/home/data/product_service.dart';
import 'package:easy_vet/features/home/domain/product_repository.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
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

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(service: getIt<AuthService>()),
  );

  getIt.registerFactory<LoginViewModel>(
    () => LoginViewModel(repository: getIt<AuthRepository>()),
  );
}
