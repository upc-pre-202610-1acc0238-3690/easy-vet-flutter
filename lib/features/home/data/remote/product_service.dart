import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/features/home/data/remote/product_dto.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String _baseUrl =
      'https://petapi-591531460223.us-central1.run.app/api/products';

  Future<List<ProductDto>> getProducts() async {
    final Uri url = Uri.parse(_baseUrl);
    final http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      final List maps = json['results'];

      return maps.map((map) => ProductDto.fromJson(map)).toList();
    }
    return [];
  }
}
