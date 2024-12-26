import 'package:flutter/material.dart';
import '../services/services.dart';

class RegularVerbsProvider extends ChangeNotifier {
  List _regularVerbs = [];

  List get regularVerbs => _regularVerbs;

  Future<List> getAllVerbs() async {
    final data = await RegularVerbsServices().getAllVerbs();
    _regularVerbs = data;
    notifyListeners();
    return data;
  }
}
