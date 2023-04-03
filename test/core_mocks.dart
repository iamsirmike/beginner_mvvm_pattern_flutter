import 'package:flutter_boilerplate_mvvm_pattern/core/services/user_service.dart';
import 'package:flutter_boilerplate_mvvm_pattern/utils/api_service.dart';
import 'package:mocktail/mocktail.dart';

class MockRestClient extends Mock implements ApiService {}

class MockUserService extends Mock implements UserService {}
