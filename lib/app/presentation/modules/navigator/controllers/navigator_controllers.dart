import 'package:flutter/material.dart';

class NavigatorController extends ChangeNotifier {
  NavigatorController();

  final PageController? pageController = PageController();

  void onPageView(int i) {
    pageController?.jumpToPage(i);
    notifyListeners();
  }
}
