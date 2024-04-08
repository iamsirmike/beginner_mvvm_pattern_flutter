import 'dart:convert';

import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/api_service.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/persistent_data.dart';

abstract class UserService {
  Future<List<User>> getUsers();
  Future<User?> getUserFromApi();
  Future<User?> getPersistedUser();
}

class UserServiceImpl implements UserService {
  UserServiceImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<User>> getUsers() async {
    final response = await _apiService.get('/users');

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.data);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<User?> getUserFromApi() async {
    final response = await _apiService.get('/api/');

    print("===> $response");

    if (response.statusCode == 200) {
      // final jsonData = jsonDecode(response.data);
      return User.fromJson(response.data);
    } else {
      return null;
    }
  }

  @override
  Future<User?> getPersistedUser() async {
    final user = await runPersistedQuery<User?>(
      'cachedUser',
      false,
      () async {
        final response = await _apiService.get('/api/');
        return response.data;
      },
      (data) => User.fromJson(data),
    );
    print("===> user ${user?.results?.length}");
    return user;
  }

  // @override
  // Future<User?> getPersistedUser() async {
  //   final user = await runPersistedQuery<User?>(
  //     'cachedUser',
  //     false,
  //     getUserFromApi,
  //     (json) => User.fromJson(json),
  //   );
  //   print("===> user ${user?.results?[0].name?.first}");
  //   return user;
  // }
}
