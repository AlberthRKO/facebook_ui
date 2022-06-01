import 'package:auto_size_text/auto_size_text.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:facebook_ui/utils/complement.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:facebook_ui/widget/circle_button.dart';
import 'package:facebook_ui/widget/custom_avatar.dart';
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

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: responsive.heightPercent(55),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            HeaderPost(post: post),
            SizedBox(
              height: responsive.heightPercent(1),
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => debugPrint(post.userName),
                    highlightColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      responsive.widthPercent(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: responsive.heightPercent(1),
            ),
            ActionPost(
              post: post,
            ),
            const Divider(
              thickness: 1,
            ),
            CommentPost(
              post: post,
            )
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
    final textColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar reutilizando del widget
          CustomAvatar(
            width: responsive.widthPercent(7),
            height: responsive.widthPercent(7),
            perfil: post.comment.userProfileIcon,
            child: const SizedBox(),
            borderColor:
                themeState.isDarkTheme ? Colors.white : Colors.transparent,
          ),
          SizedBox(
            width: responsive.widthPercent(3),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.comment.userName,
                  style: TextStyle(
                      fontSize: responsive.widthPercent(2.7),
                      fontWeight: FontWeight.bold,
                      color: themeState.isDarkTheme
                          ? null
                          : const Color(0xff1B1B1B)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    post.comment.comment,
                    style: TextStyle(
                      fontSize: responsive.widthPercent(2.5),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Me gusta',
                      style: TextStyle(
                        fontSize: responsive.widthPercent(2.5),
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      width: responsive.widthPercent(3),
                    ),
                    Text(
                      'Responder',
                      style: TextStyle(
                        fontSize: responsive.widthPercent(2.5),
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionPost extends StatelessWidget {
  const ActionPost({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final bgIcon = Theme.of(context).highlightColor;
    final iconColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                post.comments.toString() + ' Comentarios -',
                style: TextStyle(
                  fontSize: responsive.widthPercent(3),
                ),
              ),
              const SizedBox(width: 3),
              Text(
                post.shared.toString() + ' Compartidas',
                style: TextStyle(
                  fontSize: responsive.widthPercent(3),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: responsive.widthPercent(35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleButton(
                      callback: () => debugPrint('Like'),
                      icon: SvgPicture.asset(
                        assetIcon + 'like_icon.svg',
                        color: iconColor,
                        height: responsive.widthPercent(3),
                      ),
                      background: bgIcon,
                      width: responsive.heightPercent(4),
                      height: responsive.heightPercent(4),
                    ),
                    CircleButton(
                      callback: () => debugPrint('Comment'),
                      icon: SvgPicture.asset(
                        assetIcon + 'comment_icon.svg',
                        color: iconColor,
                        height: responsive.widthPercent(3),
                      ),
                      background: bgIcon,
                      width: responsive.heightPercent(4),
                      height: responsive.heightPercent(4),
                    ),
                    CircleButton(
                      callback: () => debugPrint('Share'),
                      icon: SvgPicture.asset(
                        assetIcon + 'share_icon.svg',
                        color: iconColor,
                        height: responsive.widthPercent(3),
                      ),
                      background: bgIcon,
                      width: responsive.heightPercent(4),
                      height: responsive.heightPercent(4),
                    ),
                  ],
                ),
              ),
              // Seccion de reacciones
              SizedBox(
                width: responsive.widthPercent(45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        post.principalUserReaction +
                            ' y ' +
                            post.reactions.toString() +
                            ' personas más',
                        style: TextStyle(
                          fontSize: responsive.widthPercent(2.5),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    // reacciones
                    Expanded(
                      child: SizedBox(
                        height: responsive.heightPercent(4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              right: responsive.widthPercent(4),
                              child: Container(
                                height: responsive.widthPercent(5),
                                width: responsive.widthPercent(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.solidThumbsUp,
                                    color: Colors.white,
                                    size: responsive.widthPercent(2.5),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                height: responsive.widthPercent(5),
                                width: responsive.widthPercent(5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    color: Colors.white,
                                    size: responsive.widthPercent(2.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
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
    final bgIcon = Theme.of(context).highlightColor;
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
