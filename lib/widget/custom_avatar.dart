import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar(
      {Key? key,
      required this.width,
      required this.height,
      this.border = 2.0,
      this.borderColor = const Color(0xfff4f6f8),
      required this.perfil,
      required this.child})
      : super(key: key);

  final double width, height, border;
  final Color borderColor;
  final String perfil;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(perfil),
          ),
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: border,
          )),
      child: child,
    );
  }
}
