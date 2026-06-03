import 'package:easy_vet/features/home/data/product_repository_impl.dart';
import 'package:easy_vet/features/home/data/product_service.dart';
import 'package:easy_vet/features/home/presentation/home_page.dart';
import 'package:easy_vet/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            repository: ProductRepositoryImpl(service: ProductService()),
          ),
          child: HomePage(),
        ),
      ),
    );
  }
}
