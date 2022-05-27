import 'package:facebook_ui/screen/friends_screen.dart';
import 'package:facebook_ui/screen/home_screen.dart';
import 'package:facebook_ui/screen/settings_screen.dart';
import 'package:facebook_ui/screen/shop_screen.dart';
import 'package:facebook_ui/screen/watch_screen.dart';
import 'package:facebook_ui/widget/navigator_bars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/local_providers.dart';
import '../theme/theme_state.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarState = Provider.of<BottomBarState>(context);
    final screensState = Provider.of<ScreensState>(context);
    // Consumimos la informacion del theme para poder leerlo aqui
    final themeState = Provider.of<ThemeState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeState.currentTheme,
      title: 'Facebook UI',
      home: Scaffold(
        // Stack que cubre toda la pantalla y x encima va el botoomvar
        body: Stack(
          children: [
            // Lista de las paginas
            PageView(
              // llamamos al controlador
              controller: screensState.pageController,
              // quitamos el scroll para q solo con botones se mueva
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeScreen(),
                WatchScreen(),
                ShoppScreen(),
                FriendsScreen(),
                SettingsScreen(),
              ],
            ),
            // Bootom navigation var
            NavigationBars(
                showBar: bottomBarState.showBottomBar,
                selectedIndex: screensState.page),
          ],
        ),
      ),
    );
  }
}
