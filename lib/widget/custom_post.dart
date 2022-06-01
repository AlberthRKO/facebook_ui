import 'package:auto_size_text/auto_size_text.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/complement.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:facebook_ui/widget/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../data/post.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: responsive.heightPercent(55),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 10,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Column(
          children: [
            HeaderPost(post: post),
            SizedBox(
              height: responsive.heightPercent(1.5),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    responsive.widthPercent(5),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(post.postImage),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: responsive.heightPercent(1),
            ),
            CommentPost(
              post: post,
            ),
          ],
        ),
      ),
    );
  }
}

class CommentPost extends StatelessWidget {
  const CommentPost({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);
    final bgIcon = Theme.of(context).buttonColor;
    final iconColor = Theme.of(context).colorScheme.secondary;
    return Column(
      children: [
        Row(
          children: [
            Text(
              post.comments.toString() + ' Comentarios',
              style: TextStyle(
                color: grey,
                fontSize: responsive.widthPercent(2.5),
              ),
            )
          ],
        )
      ],
    );
  }
}

class HeaderPost extends StatelessWidget {
  const HeaderPost({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final themeState = Provider.of<ThemeState>(context);
    final bgIcon = Theme.of(context).buttonColor;
    final iconColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: responsive.heightPercent(5),
                height: responsive.heightPercent(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(post.userProfileIcon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: responsive.widthPercent(2),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: TextStyle(
                        fontSize: responsive.widthPercent(3.5),
                        fontWeight: FontWeight.w700,
                        color: iconColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(assetIcon + 'globe.svg'),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          post.timePost,
                          style: TextStyle(
                            fontSize: responsive.widthPercent(2.5),
                            color: grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: responsive.widthPercent(2),
              ),
              Row(
                children: [
                  CircleButton(
                    height: responsive.widthPercent(6),
                    width: responsive.widthPercent(6),
                    callback: () => debugPrint('star'),
                    icon: FaIcon(
                      FontAwesomeIcons.solidStar,
                      color: themeState.isDarkTheme
                          ? iconColor
                          : const Color(0xff3ca1f5),
                      size: responsive.heightPercent(1.5),
                    ),
                    background: bgIcon,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleButton(
                    callback: () => debugPrint('Options'),
                    height: responsive.widthPercent(6),
                    width: responsive.widthPercent(6),
                    icon: FaIcon(
                      FontAwesomeIcons.ellipsisH,
                      color: themeState.isDarkTheme
                          ? iconColor
                          : const Color(0xffa1a8bf),
                      size: responsive.heightPercent(1.5),
                    ),
                    background: bgIcon,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: responsive.heightPercent(1.1),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              post.descriptionPost,
              style: TextStyle(
                fontSize: responsive.widthPercent(3),
                color: iconColor,
              ),
              maxLines: 10,
              minFontSize: 11,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
