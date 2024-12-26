import 'package:flutter/material.dart';
import '../services/vocabulary_services.dart';

class VocabularyProvider extends ChangeNotifier {
  List _vocabularyList = [];

  List get vocabularyList => _vocabularyList;
  
  Future<List> getVocabulary() async {
    final data = await VocabularyServices().getVocabulary();
    _vocabularyList = data;
    notifyListeners();
    return data;
  }
}
