import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/models/user.dart';
import 'package:flutter_boilerplate_mvvm_pattern/core/services/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../core_mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MockRestClient apiService;

  setUpAll(() {
    apiService = MockRestClient();
  });

  group('fetch user bonds: ', () {
    test('return purchased bonds when the request completes successfully',
        () async {
      final mockRepo = UserServiceImpl(apiService: apiService);
      String url = '/users';

      when(() => apiService.get('/users')).thenAnswer(
        (_) => Future.value(
          Response(
            statusCode: 200,
            data: {
              "id": 1,
              "name": "Mike",
              "email": "mike@gmail.com",
            },
            requestOptions: RequestOptions(
                path: url, headers: {}, responseType: ResponseType.json),
          ),
        ),
      );

      final data = await mockRepo.getUsers();
      expect(data, isA<User>());
    });
  });
}
