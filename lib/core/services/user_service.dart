import 'dart:convert';

import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/api_service.dart';

class UserService {
  UserService({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<List<User>> getUsers() async {
    final response = await _apiService.get('/users');

    if (response.statusCode == 200) {
      final jsonData = json.decode(response);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
