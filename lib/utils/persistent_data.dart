import 'dart:convert';

import 'package:flutter_boilerplate_mvvm_pattern/utils/shared_pref.dart';

Future<T?> runPersistedQuery<T>(
  String key,
  bool remoteOnly,
  Future<T> Function() fetchFromApi,
  T Function(Map<String, dynamic>) deserializer,
) async {
  AppPreferences appPreferences = AppPreferences();
  try {
    if (!remoteOnly) {
      // attempt to load from cache
      try {
        final cacheData = await appPreferences.getString(key);

        if (cacheData != null) {
          final data = jsonDecode(cacheData);
          await Future.delayed(
              const Duration(milliseconds: 200)); // add wait time
           return deserializer(data);
        }
      } catch (e) {
        // Something went wrong loading from the cache.
        // Expected data might have changed.
        // Just log a warning and proceed.
        print("===>error $e");
      }
    }

    try {
      T newData = await fetchFromApi();

      await appPreferences.setString(
        key,
        jsonEncode(newData),
      );
      return newData;
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  } catch (e) {
    rethrow;
  }
}
