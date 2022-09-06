import 'package:dio/dio.dart';

import '../models/product_model.dart';
import 'base_repository.dart';

class ProductRepository extends BaseRepository<ProductModel> {
  @override
  Future<List<ProductModel>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);

    return List.from(
      response.data.map(
        (entity) => ProductModel.fromMap(entity),
      ),
    );
  }

  @override
  Future<ProductModel> getById(String path, int id) async {
    Dio dio = Dio();

    final response = await dio.get('$path/$id');
    return ProductModel.fromMap(response.data);
  }

  Future<List<ProductModel>> getProductByCategory(int id) async {
    Dio dio = Dio();

    final response = await dio.get('http://zuplae.vps-kinghost.net:8083/api/Product/GetByCategory/$id');

    return List.from(
      response.data.map(
        (entity) => ProductModel.fromMap(entity),
      ),
    );
  }
}

