import 'package:flutter/material.dart';
import '../services/services.dart';

class ReadingProvider extends ChangeNotifier {
  List _readings = [];
  List get readings => _readings;

  Future<List> getReadings() async {
    final data = await ReadingServices().getReadings();
    _readings = data;
    notifyListeners();
    return data;
  }

  getReadingById(int id) async {
    final data = await ReadingServices().getReadingById(id);
    return data;
  }
}
