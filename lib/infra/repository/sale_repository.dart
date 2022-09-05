
import 'package:dio/dio.dart';

import '../models/sale_model.dart';
import 'base_repository.dart';

class SaleRepository extends BaseRepository<SaleModel>{
  @override
  Future<List<SaleModel>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);

    return List.from(
      response.data.map(
        (entity) => SaleModel.fromMap(entity),
      ),
    );
  }
}