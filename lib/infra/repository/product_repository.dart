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
}
