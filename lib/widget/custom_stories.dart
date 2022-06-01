import 'package:dotted_border/dotted_border.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../data/storie.dart';

class CustomStories extends StatelessWidget {
  const CustomStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.widthPercent(4)),
      child: Container(
        height: responsive.widthPercent(27),
        decoration: const BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        child: ListView.builder(
          itemCount: stories.length,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return StorieWidget(storie: stories[index]);
          },
        ),
      ),
    );
  }
}

class StorieWidget extends StatelessWidget {
  const StorieWidget({Key? key, required this.storie}) : super(key: key);

  final Storie storie;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);
    final imageStory = storie.previewStory;
    final image = storie.userImage;
    final username = storie.userName;
    final dotPattern = (image == 'none') ? List.of([3.5]) : List.of([130.0]);

    return Container(
      width: responsive.widthPercent(20),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // color: Colors.red,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: responsive.widthPercent(19),
            height: responsive.widthPercent(19),
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(responsive.widthPercent(5)),
              image: DecorationImage(
                image: AssetImage(imageStory),
                fit: BoxFit.cover,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: Colors.transparent,
                borderRadius: BorderRadius.circular(responsive.widthPercent(4)),
                onTap: () => debugPrint(username),
                child: const SizedBox(),
              ),
            ),
          ),
          Positioned(
            top: responsive.widthPercent(16),
            child: SizedBox(
              // color: Colors.yellow,
              child: Column(
                children: [
                  // parte de la imagen pequeña
                  DottedBorder(
                    // elegimos el tipo de borde
                    borderType: BorderType.Oval,
                    padding: const EdgeInsets.all(3),
                    // definimos la punteada en base a la imagen vacia
                    dashPattern: dotPattern,
                    color: const Color(0xff3ca1f5),
                    child: SizedBox(
                      width: responsive.widthPercent(5),
                      height: responsive.widthPercent(5),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xff3284f5),
                        backgroundImage:
                            image == 'none' ? null : AssetImage(image),
                        child: image == 'none'
                            ? const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 8,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: responsive.widthPercent(3),
                      fontWeight: FontWeight.w400,
                      color: (themeState.isDarkTheme)
                          ? const Color(0xffd4d5d8)
                          : const Color(0xff747EA0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
