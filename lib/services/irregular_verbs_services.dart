import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class IrregularVerbsServices {
  Future<List<IrregularVerbsModels>> getAllVerbs() async {
    final response = await rootBundle.loadString('assets/irregular.json');
    final data = json.decode(response);
    return List<IrregularVerbsModels>.from(
        data.map((json) => IrregularVerbsModels.fromJson(json)));
  }
}
