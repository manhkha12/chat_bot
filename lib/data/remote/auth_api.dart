import 'package:dio/dio.dart';
import 'package:smart_home/data/remote/handler/api_handler.dart';

class AuthApi {
  final ApiHandler _apiHandler;

  AuthApi(this._apiHandler);

  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    final resp = await _apiHandler.post(
      '/auth/login',
      body: params,
    );
    return resp;
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> params) async {
    final resp = await _apiHandler.post(
      '/auth/register',
      body: params,
    );
    return resp;
  }

  Future<Map<String, dynamic>> authToken(String refreshToken) async {
    final resp = await _apiHandler.post(
      '/auth/refresh',
      body: {
        'refresh_token': refreshToken,
      },
    );
    return resp;
  }

  Future<Map<String, dynamic>> profileStudent(String token) async {
    final resp = await _apiHandler.get(
      '/users/me/',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Gửi Access Token ở đây
        },
      ),
    );

    return resp;
  }

  Future<Map<String, dynamic>> updateProfileStudent(
      String token, Map<String, dynamic> params) async {
    final resp = await _apiHandler.patch(
      '/users/me/',
      body: params,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Gửi Access Token ở đây
        },
      ),
    );

    return resp;
  }
}
