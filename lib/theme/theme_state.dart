import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeState with ChangeNotifier {
  // definimos la variable con el thema light ya definiendo sus valores que tendra
  ThemeData _currentTheme = lightMode;
  // inicializamos un boleano como false.. ya q el lught es el primario
  bool _darkTheme = false;

  // la variable es privada asiq iniciamos su get y set
  ThemeData get currentTheme => _currentTheme;
  bool get isDarkTheme => _darkTheme;

  set isDarkTheme(bool value) {
    _darkTheme = value;

    if (value) {
      // si es true aplicamos el tema dark y tambien light en el tap bar de la hora
      _currentTheme = darkMode;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      _currentTheme = lightMode;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    // ponemos el escuchador que dara valor a todos los hijos
    notifyListeners();
  }
}

final ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xff070c20),
  backgroundColor: const Color(0xff272d3a),
  buttonColor: const Color(0xff2f3643),
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xff2f3643)),
  iconTheme: const IconThemeData(color: Color(0xff515765)),
  primaryIconTheme: const IconThemeData(color: Color(0xff3284f5)),
  dividerColor: const Color(0xff2d3340),
  cardColor: const Color(0xff2e3441),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffffffff)),
);

final ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: const Color(0xfff4f6f8),
  backgroundColor: const Color(0xffffffff),
  buttonColor: const Color(0xfff9fafb),
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xfff9fafb)),
  iconTheme: const IconThemeData(color: Color(0xffd5dcef)),
  primaryIconTheme: const IconThemeData(color: Color(0xff3284f5)),
  dividerColor: const Color(0xfff8f8f8),
  cardColor: const Color(0xffffffff),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff364987)),
);
