import 'package:get_it/get_it.dart';

import '../infra/models/user_model.dart';

final getIt = GetIt.I;

UserModel logedUser = UserModel(
    name: 'name',
    birthday: 'birthday',
    cpf: 'cpf',
    company: 'company',
    cnpj: 'cnpj',
    telephone: 'telephone',
    mobileNumber: 'mobileNumber',
    cep: 'cep',
    adress: 'adress',
    email: 'email',
    password: 'password');

void setupGetIt() => getIt.registerSingleton<UserModel>(logedUser);
