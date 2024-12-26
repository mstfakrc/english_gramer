import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class ExpressionsServices {
  Future<List<ExpressionsModels>> getExpressions() async {
    final response = await rootBundle.loadString('assets/expressions.json');
    final data = json.decode(response);
    return List<ExpressionsModels>.from(
        data.map((json) => ExpressionsModels.fromJson(json)));
  }
}
