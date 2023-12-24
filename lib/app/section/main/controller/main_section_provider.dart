import 'package:flutter/material.dart';

class MainSectionProvider extends ChangeNotifier {
  bool _isHover = false;

  bool get isHover => _isHover;

  void handleHover(bool event) {
    _isHover = event;
    notifyListeners();
  }
}
