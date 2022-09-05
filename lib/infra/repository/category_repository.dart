import 'package:dio/dio.dart';
import '../models/category_model.dart';
import 'base_repository.dart';

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
