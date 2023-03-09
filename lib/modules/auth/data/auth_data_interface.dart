//abstract class for method/function

import '../domain/login_res.dart';

abstract class AuthDataInterface {
  Future<Login> login({
    required String email,
    required String password,
  });
}
