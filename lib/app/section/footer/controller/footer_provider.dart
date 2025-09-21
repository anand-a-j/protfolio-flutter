import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/utils/urls.dart';

class FooterProvider extends ChangeNotifier {
  final List socialIcon = [
    Assets.github,
    Assets.linkedin,
    Assets.twitter,
    Assets.whatsapp
  ];

  final _lanuchUrl = [
    Urls.githubAccountUrl,
    Urls.linkedinUrl,
    Urls.xUrl,
    Urls.whatsappUrl
  ];

  get lanuchUrl => _lanuchUrl;

  bool _isHover = false;
  int _currentIndex = 0;

  bool get isHover => _isHover;
  int get currentIndex => _currentIndex;

  handleHover(bool value, int index) {
    for (int i = 0; i < 4; i++) {
      if (i == index) {
        _isHover = value;
        _currentIndex = index;
      }
    }
    notifyListeners();
  }
}
