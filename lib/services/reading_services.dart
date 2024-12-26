import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/models.dart';

class ReadingServices {
  Future<List<ReadingModels>> getReadings() async {
    final response = await rootBundle.loadString('assets/reading.json');
    final data = json.decode(response);
    return List<ReadingModels>.from(
        data.map((json) => ReadingModels.fromJson(json)));
  }

  Future<ReadingModels> getReadingById(int id) async {
    final response = await rootBundle.loadString('assets/reading.json');
    final data = json.decode(response);
    final reading = data.firstWhere((json) => json['id'] == id);
    return ReadingModels.fromJson(reading);
  }
}
