import 'package:gear/infra/models/user_model.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.I;

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

void setupGetIT() => getit.registerSingleton<UserModel>(logedUser);
