import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/model_standing_epl.dart';

class ApiStanding {
  Future<Standing?> getStandingData() async {
    final url = Uri.parse(
        'https://www.chelseafc.com/en/api/fixtures/league-table?entryId=30EGwHPO9uwBCc75RQY6kg');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return Standing.fromJson(json.decode(response.body));
      } else {
        debugPrint('Ошибка при загрузке данных: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Произошла ошибка: $e');
    }
    return null;
  }
}
