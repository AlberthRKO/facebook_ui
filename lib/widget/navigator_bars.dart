import 'package:facebook_ui/data/local_providers.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/complement.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:facebook_ui/widget/circle_button.dart';
import 'package:facebook_ui/widget/notification_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

const _duration = Duration(milliseconds: 400);
const double _bottomBarHide = -100.0;
const double _bottomBarShow = 10.0;

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
      left: responsive.widthPercent(10),
      right: responsive.widthPercent(10),
      // Contenido del navbar
      child: Container(
        // le damos un tamaño del 8% de la pantalla
        height: responsive.heightPercent(8),
        decoration: BoxDecoration(
          // preguntamos si el tema es dark  para luego consultar en q posicion esta el navbar,
          //si esta en el 1 usamos el color primario y si no esta ahi usamos el secundario que es mas fuerte
          color: (themeState.isDarkTheme)
              ? (selectedIndex == 4)
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: themeState.isDarkTheme
                  ? Colors.white.withOpacity(.03)
                  : const Color(0xFFA7A9AF).withOpacity(.2),
              offset: const Offset(4, 4),
              blurRadius: 20,
            )
          ],
        ),
        // Seccion de los bars de navegacion
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleButton(
              callback: () => screenState.page = 0,
              icon: SvgPicture.asset(
                assetIcon + 'home_icon.svg',
                color: selectedIndex == 0
                    ? Theme.of(context).primaryIconTheme.color
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              background: Colors.transparent,
            ),
            Stack(
              children: [
                CircleButton(
                  callback: () => screenState.page = 1,
                  icon: SvgPicture.asset(
                    assetIcon + 'watch_icon.svg',
                    color: selectedIndex == 1
                        ? Theme.of(context).primaryIconTheme.color
                        : Theme.of(context).iconTheme.color,
                    height: responsive.heightPercent(2.5),
                  ),
                  background: Colors.transparent,
                ),
                const Positioned(
                  right: 0,
                  top: 4,
                  child: NotificationCircle(),
                )
              ],
            ),
            Stack(
              children: [
                CircleButton(
                  callback: () => screenState.page = 2,
                  icon: SvgPicture.asset(
                    assetIcon + 'shopping_icon.svg',
                    color: selectedIndex == 2
                        ? Theme.of(context).primaryIconTheme.color
                        : Theme.of(context).iconTheme.color,
                    height: responsive.heightPercent(2.5),
                  ),
                  background: Colors.transparent,
                ),
                const Positioned(
                  right: 0,
                  top: 4,
                  child: NotificationCircle(),
                )
              ],
            ),
            CircleButton(
              callback: () => screenState.page = 3,
              icon: SvgPicture.asset(
                assetIcon + 'friends_icon.svg',
                color: selectedIndex == 3
                    ? Theme.of(context).primaryIconTheme.color
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              background: Colors.transparent,
            ),
            CircleButton(
              callback: () => screenState.page = 4,
              icon: SvgPicture.asset(
                assetIcon + 'menu_icon.svg',
                color: selectedIndex == 4
                    ? Theme.of(context).primaryIconTheme.color
                    : Theme.of(context).iconTheme.color,
                height: responsive.heightPercent(2.5),
              ),
              background: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
