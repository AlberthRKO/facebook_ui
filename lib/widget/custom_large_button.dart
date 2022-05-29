import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  const CustomLargeButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.width,
    required this.height,
    required this.fonsize,
    required this.callback,
  }) : super(key: key);

  final Widget icon;
  final String text;
  final double width, height, fonsize;
  final VoidCallback callback;

  // Widget de large button para poner en todos los botones que hay
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: callback,
        style: ButtonStyle(
          // que no tenga sombreado
          elevation: MaterialStateProperty.all<double>(0.0),
          // forma de cambiar color a los botones
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).buttonColor),
          overlayColor:
              MaterialStateProperty.all<Color>(Theme.of(context).splashColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            AutoSizeText(
              text,
              style: TextStyle(
                fontSize: fonsize,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
