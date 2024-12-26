import 'package:flutter/material.dart';
import '../services/services.dart';

class ExpressionsProvider extends ChangeNotifier {
  List _expressions = [];

  List get expressions => _expressions;

  Future<List> getExpressions() async {
    final data = await ExpressionsServices().getExpressions();
    _expressions = data;
    notifyListeners();
    return data;
  }
}
