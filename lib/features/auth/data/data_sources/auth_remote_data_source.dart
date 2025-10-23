import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velvet_bite/core/api/base_ip.dart';
import 'package:velvet_bite/features/auth/data/models/auth_model.dart';
import 'package:velvet_bite/features/auth/domain/contract_repositories/auth_contract_repository.dart';
import 'package:velvet_bite/main.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
  });

  Future<AuthModel> signUp({
    required String email,
    required String fullName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl = 'http://${BaseIp.baseIp}/velvet_bite/auth/';

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, String> body,
  ) async {
    final response = await http.post(Uri.parse('$baseUrl$path'), body: body);
    final decoded = json.decode(response.body);
    if (response.statusCode == 200) {
      prefs.setString('token', decoded['data']['token']);
      return decoded;
    } else {
      throw Exception(decoded['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future<AuthModel> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
  }) async {
    final data = await _post('sign_in.php', {
      'emailOrFullName': emailOrFullName,
      'type': type.name,
      'password': password,
    });

    return AuthModel.fromJson(data['data']);
  }

  @override
  Future<AuthModel> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    final data = await _post('sign_up.php', {
      'email': email,
      'fullName': fullName,
      'password': password,
    });

    return AuthModel.fromJson(data['data']);
  }
}
