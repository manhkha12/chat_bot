import 'package:smart_home/app_config.dart';
import 'package:smart_home/data/local/app_provider.dart';
import 'package:smart_home/data/remote/auth_api.dart';
import 'package:smart_home/models/user.dart';

class UserRepository {
  final AppProvider appProvider;
  final AppConfig appConfig;
  final AuthApi authApi;

  UserRepository({required this.appProvider, required this.appConfig,required this.authApi});
  
  Future<User> profileStudent()async{
    final token = appProvider.accessToken; 
  
  if (token == null) throw Exception("No token found");
    final resp = await authApi.profileStudent(token);
    return User.fromJson(resp);
  }

  Future<User> updateProfileStudent(Map<String,dynamic> params)async{
    final token = appProvider.accessToken;
    if (token == null) throw Exception("No token found");
    final resp = await authApi.updateProfileStudent(token, params);
    return User.fromJson(resp);
  }

}