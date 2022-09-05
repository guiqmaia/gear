
import 'package:dio/dio.dart';
import '../dto/user_dto.dart';
import '../models/user_model.dart';

import 'base_repository.dart';

class UserRepository extends BaseRepository<UserModel> {
  Future<UserModel> logon(UserDto dto) async {
    Dio dio = Dio();

    final response = await dio.post('http://192.168.0.43:81/api/Access/Logon', data: dto.toJson());

    return UserModel.fromMap(response.data);
  }

  @override
  Future<List<UserModel>> get(String path) async {
    Dio dio = Dio();

    final response = await dio.get(path);

    return List.from(
      response.data.map(
        (entity) => UserModel.fromMap(entity),
      ),
    );
  }
}
