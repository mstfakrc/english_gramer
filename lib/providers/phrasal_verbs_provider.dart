import 'package:flutter/material.dart';
import '../services/phrasal_verbs_services.dart';

class PhrasalVerbsProvider extends ChangeNotifier {
  List _phrasalVerbs = [];

  List get phrasalVerbs => _phrasalVerbs;

  Future<List> getPhrasalVerbs() async {
    final data = await PhrasalVerbsServices().getPhrasalVerbs();
    _phrasalVerbs = data;
    notifyListeners();
    return data;
  }
}
