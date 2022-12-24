import 'package:flutter/material.dart';
import 'package:secure_auth/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network/tokens.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  // ignore: prefer_const_constructors_in_immutables

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkIsLogin();
    super.initState();
  }

  void checkIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != "" && token != null) {
      final _isexpired = expired(token);
      if (_isexpired) {
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Welcome()),
          );
        });
      } else {
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Welcome()),
          );
        });
      }
    } else {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Welcome()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Secure Auth 3"),
        ),
        body: const Center(child: CircularProgressIndicator()));
  }
}
