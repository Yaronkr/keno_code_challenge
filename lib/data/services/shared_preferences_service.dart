import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesService {
  Future<int?> getInt(String keyName);
  Future<bool> saveInt(String keyName, int value);
}

class SharedPreferencesServiceImp implements SharedPreferencesService {
  @override
  Future<int?> getInt(String keyName) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getInt(keyName);
    } catch (e) {
      debugPrint('share preferences get int error: $e');
      throw Exception(e);
    }
  }

  @override
  Future<bool> saveInt(String keyName, int value) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.setInt(keyName, value);
    } catch (e) {
      debugPrint('share preferences get int error: $e');
      throw Exception(e);
    }
  }
}
