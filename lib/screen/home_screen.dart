import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Text(
        'Ancho : ' + size.width.toString() + ' Alto: ' + size.height.toString(),
      )),
    );
  }
}
