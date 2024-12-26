import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class PhrasalVerbsServices {
  Future<List<PhrasalVerbModels>> getPhrasalVerbs() async {
    final response = await rootBundle.loadString('assets/phrasal.json');
    final data = json.decode(response);
    return List<PhrasalVerbModels>.from(
        data.map((json) => PhrasalVerbModels.fromJson(json)));
  }
}
