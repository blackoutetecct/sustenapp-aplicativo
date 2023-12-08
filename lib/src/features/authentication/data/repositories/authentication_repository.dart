import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:susten_app/src/core/utils/http.dart';
import 'package:susten_app/src/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<bool> isUserAlreadyLogged() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final token = prefs.getString('token') as String;

      token.isEmpty;

      final response =
          await MyHttpClient.post("/auth/check", data: {'token': token}, options: Options(
            headers: {
              'Authentication':"Bearer $token"
            }
          ));

      return response.data['valid'];
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final Response response = await MyHttpClient.post("/auth",
          data: {'email': email, 'senha': password});
      await prefs.setString('token', response.data);
      return;
    } catch (err) {
      throw Exception("Wrong exception");
    }
  }

  @override
  Future<void> register(
      {required String name,
      required String email,
      required String cpf,
      required String password}) async {
    try {
      final response = await MyHttpClient.post("/usuario", data: {
        'nome': name,
        'email': email,
        'senha': password,
        'cpf': cpf,
        'tipo': 'USUARIO'
      });
    } catch (e) {
      throw Exception();
    }
  }
}
