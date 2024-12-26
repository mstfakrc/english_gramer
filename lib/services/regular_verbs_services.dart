import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class RegularVerbsServices {
  Future<List<RegularVerbsModel>> getAllVerbs() async {
    final response = await rootBundle.loadString('assets/regular.json');
    final data = json.decode(response);
    return List<RegularVerbsModel>.from(
        data.map((json) => RegularVerbsModel.fromJson(json)));
  }
}
