import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class AdvicesServices {
  Future<List<AdvicesModels>> getAbvices() async {
    final response = await rootBundle.loadString('assets/advices.json');
    final data = json.decode(response);
    return List<AdvicesModels>.from(
        data.map((json) => AdvicesModels.fromJson(json)));
  }
}
