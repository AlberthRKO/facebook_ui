import 'package:flutter/material.dart';

class BottomBarState with ChangeNotifier {
  bool _showBottomBar = true;

  bool get showBottomBar => _showBottomBar;

  set showBottomBar(bool hideMenu) {
    _showBottomBar = hideMenu;
    notifyListeners();
  }
}

class ScreensState with ChangeNotifier {
  final _pageController = PageController();
  int _page = 0;

  // Gettes y settes de las variables privadas
  int get page => _page;
  PageController get pageController => _pageController;

  // si el valor cambia de 0 se redirecciona a la otra pagina con una animacion
  set page(int page) {
    _page = page;
    if (_page >= 0) {
      _pageController.animateToPage(
        _page,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
    notifyListeners();
  }
}
