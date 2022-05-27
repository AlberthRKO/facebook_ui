import 'package:facebook_ui/data/local_providers.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _duration = Duration(milliseconds: 400);
const double _bottomBarHide = -100.0;
const double _bottomBarShow = 0.0;

class NavigationBars extends StatelessWidget {
  const NavigationBars(
      {Key? key, this.showBar = true, required this.selectedIndex})
      : super(key: key);

  // damos valor por defecto de true para que se visualize el navbar
  final bool showBar;
  // valor para saber en q paginacion estamos
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    final screenState = Provider.of<ScreensState>(context);
    final responsive = Responsive.of(context);

    return AnimatedPositioned(
      duration: _duration,
      // si es true mostramos el navbar y si no lo ocultamos con las posiciones
      bottom: showBar ? _bottomBarShow : _bottomBarHide,
      left: 0,
      right: 0,
      // Contenido del navbar
      child: Container(
        // le damos un tamaño del 8% de la pantalla
        height: responsive.heightPercent(8),
        decoration: BoxDecoration(
          // preguntamos si el tema es dark  para luego consultar en q posicion esta el navbar,
          //si esta en el 1 usamos el color primario y si no esta ahi usamos el secundario que es mas fuerte
          color: (themeState.isDarkTheme)
              ? (selectedIndex == 1)
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        child: Text('data'),
      ),
    );
  }
}
