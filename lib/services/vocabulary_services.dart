import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class VocabularyServices {
  Future<List<VocabularyModels>> getVocabulary() async {
    final response = await rootBundle.loadString('assets/vocabulary.json');
    final data = json.decode(response);
    return List<VocabularyModels>.from(
        data.map((json) => VocabularyModels.fromJson(json)));
  }
}
