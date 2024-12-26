import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  bool _allPagesViewed = false;
  
  PageViewProvider({required bool isAllPagesViewed}) : _allPagesViewed = isAllPagesViewed;

  bool get allPagesViewed => _allPagesViewed;

  void setAllPagesViewed(bool value) {
    _allPagesViewed = value;
    notifyListeners();
  }
}