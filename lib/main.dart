import 'package:facebook_ui/data/local_providers.dart';
import 'package:facebook_ui/screen/screen_controller.dart';
import 'package:facebook_ui/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // retornamos un multiprovider porque tenemos varios escuchas en TR
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarState()),
        ChangeNotifierProvider(create: (_) => ScreensState()),
        // Gestion de estado de el tema
        ChangeNotifierProvider(create: (_) => ThemeState()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenController(),
      ),
    );
  }
}
