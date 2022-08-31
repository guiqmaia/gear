import 'package:dio/dio.dart';

import '../models/base_model.dart';

class BaseRepository {
  Future post(String path, BaseModel model) async {
    Dio dio = Dio();

    await dio.post(
      path,
      data: model.toMap(),
    );
  }

  Future<List<BaseModel>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);
    return response.data;
  }

  Future<BaseModel> getById(String path, int id) async {
    Dio dio = Dio();

    final response = await dio.get('$path/$id');
    return response.data;
  }

  Future put(String path, BaseModel model) async {
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
