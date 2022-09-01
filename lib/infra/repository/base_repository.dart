
import 'package:dio/dio.dart';

import '../models/base_model.dart';

class BaseRepository<T extends BaseModel> {

  Future post(String path, T model) async {
    Dio dio = Dio();

    await dio.post(
      path,
      data: model.toMap(),
    );
  }

  Future<List<T>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);

    return response.data;
  }

  Future<T> getById(String path, int id) async {
    Dio dio = Dio();

    final response = await dio.get('$path/$id');
    return response.data;
  }

  Future put(String path, T model) async {
    Dio dio = Dio();

    await dio.put(
      path,
      data: model.toMap(),
    );
  }

  Future delete(String path, int id) async {
    Dio dio = Dio();

    await dio.delete(
      path,
      data: id,
    );
  }
}
