import 'package:secure_auth/splash.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Secure Auth 3',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Splash(),
    navigatorKey: navigatorKey,
  ));
}
