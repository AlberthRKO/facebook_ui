import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/complement.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:facebook_ui/widget/circle_button.dart';
import 'package:facebook_ui/widget/custom_avatar.dart';
import 'package:facebook_ui/widget/custom_large_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    const perfil = 'assets/common/perfil/profile.jpg';

    return Container(
      height: responsive.heightPercent(25),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: responsive.widthPercent(4),
              child: Column(
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: responsive.heightPercent(1.5),
                  ),
                  const SearchBar(perfil: perfil),
                  SizedBox(
                    height: responsive.heightPercent(2),
                  ),
                  const PostAction(),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: const Appbar(
                perfil: perfil,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostAction extends StatelessWidget {
  const PostAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomLargeButton(
          icon: const FaIcon(
            FontAwesomeIcons.camera,
            color: Color(0xff76c997),
            size: 14,
          ),
          text: 'Fotos',
          width: responsive.widthPercent(26),
          height: responsive.heightPercent(4),
          fonsize: responsive.heightPercent(1),
          callback: () => debugPrint('Camera'),
        ),
        CustomLargeButton(
          icon: Stack(
            children: [
              const FaIcon(
                FontAwesomeIcons.video,
                color: Color(0xffee305e),
                size: 14,
              ),
              Positioned(
                top: 4,
                left: 2,
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          text: 'En vivo',
          width: responsive.widthPercent(26),
          height: responsive.heightPercent(4),
          fonsize: responsive.heightPercent(1),
          callback: () => debugPrint('Live'),
        ),
        CustomLargeButton(
          icon: const FaIcon(
            FontAwesomeIcons.eye,
            color: Color(0xff3284f5),
            size: 14,
          ),
          text: 'Video Corto',
          width: responsive.widthPercent(30),
          height: responsive.heightPercent(4),
          fonsize: responsive.heightPercent(1),
          callback: () => debugPrint('MinWatch'),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.perfil,
  }) : super(key: key);

  final String perfil;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAvatar(
          width: responsive.widthPercent(6.5),
          height: responsive.widthPercent(6.5),
          borderColor: themeState.isDarkTheme
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          perfil: perfil,
          child: const SizedBox(),
        ),
        SizedBox(
          width: responsive.widthPercent(1),
        ),
        SizedBox(
          // color: Colors.red,
          width: responsive.widthPercent(70),
          child: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: 'Que estas pensando Alberth',
              hintStyle: TextStyle(
                color: themeState.isDarkTheme
                    ? Theme.of(context).colorScheme.secondary
                    : const Color(0xff9aa2bf),
                fontSize: responsive.widthPercent(3.5),
              ),
            ),
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: responsive.heightPercent(1.8),
            ),
          ),
        ),
        SizedBox(
          width: responsive.widthPercent(1),
        ),
        ClipOval(
          child: SizedBox(
            height: responsive.widthPercent(6),
            width: responsive.widthPercent(6),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => debugPrint('Emoji'),
                child: Image.asset(assetIcon + 'smile_icon.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget para el appbar
class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    required this.perfil,
  }) : super(key: key);

  final String perfil;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final colorIcon = Theme.of(context).colorScheme.secondary;
    final bgIcon = Theme.of(context).buttonColor;

    final themeState = Provider.of<ThemeState>(context);

    return Padding(
      padding: EdgeInsets.only(top: responsive.heightPercent(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleButton(
            callback: () => debugPrint('Facebook'),
            icon: FittedBox(
              fit: BoxFit.none,
              child: FaIcon(
                FontAwesomeIcons.facebook,
                size: responsive.widthPercent(8.5),
                color: const Color(0xff3284f5),
                textDirection: TextDirection.ltr,
              ),
            ),
            background: Colors.white,
            height: responsive.widthPercent(8.5),
            width: responsive.widthPercent(8.5),
          ),
          // le damos tamaño a este widget y con expanded hacemos q los iconos ocupen todo el tamaño y empujen el avatar a la orilla
          SizedBox(
            width: responsive.widthPercent(50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleButton(
                        callback: () => debugPrint('Search'),
                        icon: SvgPicture.asset(
                          assetIcon + 'search_icon.svg',
                          height: responsive.widthPercent(4.5),
                          color: colorIcon,
                        ),
                        background: bgIcon,
                        width: responsive.widthPercent(8),
                        height: responsive.widthPercent(8),
                      ),
                      Stack(
                        children: [
                          CircleButton(
                            callback: () => debugPrint('Notification'),
                            icon: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: colorIcon,
                              size: responsive.widthPercent(4.5),
                            ),
                            background: bgIcon,
                            height: responsive.widthPercent(8),
                            width: responsive.widthPercent(8),
                          ),
                          Positioned(
                            right: 5,
                            top: 4,
                            child: Container(
                              width: responsive.heightPercent(.9),
                              height: responsive.heightPercent(.9),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffee305e),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleButton(
                        callback: () => debugPrint('Message'),
                        icon: FaIcon(
                          FontAwesomeIcons.facebookMessenger,
                          size: responsive.widthPercent(4.5),
                          color: themeState.isDarkTheme
                              ? colorIcon
                              : const Color(0xff3ca1f5),
                        ),
                        background: bgIcon,
                        height: responsive.widthPercent(8),
                        width: responsive.widthPercent(8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ClipOval(
                  child: Hero(
                    tag: perfil,
                    child: CustomAvatar(
                      width: responsive.widthPercent(8.5),
                      height: responsive.widthPercent(8.5),
                      perfil: perfil,
                      borderColor: themeState.isDarkTheme
                          ? colorIcon
                          : Colors.transparent,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
