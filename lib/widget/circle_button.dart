import 'package:facebook_ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.callback,
    required this.icon,
    required this.background,
    this.height = 0.0,
    this.width = 0.0,
  }) : super(key: key);

  final VoidCallback callback;
  final Widget icon;
  final Color background;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    // condicion para q si n llega nada de tamaño le de un por defecto y si llega se mantenga el q mando
    final heightCircle =
        (height == 0.0) ? responsive.heightPercent(4.5) : height;
    final widthCircle = (width == 0.0) ? responsive.heightPercent(4.5) : width;
    return ClipOval(
      child: Container(
        width: widthCircle,
        height: heightCircle,
        decoration: BoxDecoration(
          color: background,
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: callback,
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
