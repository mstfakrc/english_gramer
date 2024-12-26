import 'package:flutter/material.dart';
import '../services/services.dart';

class IrregularVerbsProvider extends ChangeNotifier {
  List _irregularVerbs= [];

  List get irregularVerbs => _irregularVerbs;

  Future<List> getAllVerbs() async {
    final data = await IrregularVerbsServices().getAllVerbs();
    _irregularVerbs = data;
    notifyListeners();
    return data;
  }
}
