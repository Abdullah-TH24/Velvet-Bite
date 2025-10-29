import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:velvet_bite/core/api/base_ip.dart';
import 'package:velvet_bite/features/dishes/data/models/parent_model.dart';

abstract class DishesDataSource {
  getUserInfoAndProducts({required String token});
}

class DishesDataSourceImp implements DishesDataSource {
  @override
  getUserInfoAndProducts({required String token}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://${BaseIp.baseIp}/velvet_bite/home/home.php'),
        body: {'token': token},
      );
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        return ParentModel.fromJson(responseBody['data']);
      } else {
        throw Exception(responseBody['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
