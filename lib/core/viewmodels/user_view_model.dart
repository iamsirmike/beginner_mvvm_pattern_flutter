import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/services/user_service.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/injection_container.dart';

class UserViewModel extends ChangeNotifier {
  List<User> _users = [];
  final UserServiceImpl _userService = locator.get<UserServiceImpl>();

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    final users = await _userService.getUsers();
    _users = users;
    notifyListeners();
  }

  Future<User?> fetchUser() async {
    return await _userService.getPersistedUser();
  }
}
