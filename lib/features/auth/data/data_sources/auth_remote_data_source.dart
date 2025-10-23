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

  Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String baseUrl = 'http://${BaseIp.baseIp}/velvet_bite/auth';

  @override
  Future<AuthModel> signIn({
    required String emailOrFullName,
    required UserType type,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sign_in.php'),
      body: {
        'emailOrFullName': emailOrFullName,
        'type': type.name,
        'password': password,
      },
    );
    final decoded = json.decode(response.body);
    if (response.statusCode == 200) {
      prefs.setString('token', decoded['data']['token']);
      return AuthModel.fromJson(decoded['data']);
    } else {
      throw Exception(decoded['message'] ?? 'Something went wrong');
    }
  }

  @override
  Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sign_up.php'),
      body: {'email': email, 'fullName': fullName, 'password': password},
    );
    final decoded = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(decoded['message'] ?? 'Something went wrong');
    }
  }
}
