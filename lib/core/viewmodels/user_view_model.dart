import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/services/user_service.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/service_locator.dart';

class UserViewModel extends ChangeNotifier {
  List<User> _users = [];
  final UserService _userService = locator<UserService>();

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final users = await _userService.getUsers();
      _users = users;
      notifyListeners();
    } catch (e) {
      print('Failed to fetch users: $e');
    }
  }
}
