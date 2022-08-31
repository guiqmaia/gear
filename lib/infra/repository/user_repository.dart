import 'package:dio/dio.dart';
import 'package:gear/infra/dto/user_dto.dart';
import 'package:gear/infra/models/user_model.dart';

import 'base_repository.dart';

class UserRepository extends BaseRepository {
  Future<UserModel> logon(UserDto dto) async{ 
    Dio dio = Dio();

    final response = await dio.post('192.168.0.43:81/api/Access/Logon', data: dto.toJson());
    return response.data;
  }
}
