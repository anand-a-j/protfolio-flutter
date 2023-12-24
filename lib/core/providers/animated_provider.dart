import 'package:flutter/material.dart';

class AnimateProvider extends ChangeNotifier {
  bool _isHover = false;
  int _currentIndex = 0;

  bool get isHover => _isHover;
  int get currentIndex => _currentIndex;

  setIshover(bool value, int index) {
    for (int i = 0; i < 4; i++) {
      if (i == index) {
        _isHover = value;
        _currentIndex = index;
      }
    }
    notifyListeners();
  }
}
