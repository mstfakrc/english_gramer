import 'package:flutter/material.dart';
import '../services/services.dart';

class AdvicesProvider extends ChangeNotifier {
  List _abvices = [];

  List get abvices => _abvices;

  Future<List> getAbvices() async {
    final data = await AdvicesServices().getAbvices();
    _abvices = data;
    notifyListeners();
    return data;
  }
}
