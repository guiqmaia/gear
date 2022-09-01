import 'package:dio/dio.dart';
import 'package:gear/infra/models/category_model.dart';
import 'package:gear/infra/repository/base_repository.dart';

class CategoryRepository extends BaseRepository<CategoryModel> {
  @override
  Future<List<CategoryModel>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);

    return List.from(
      response.data.map(
        (entity) => CategoryModel.fromMap(entity),
      ),
    );
  }
}
