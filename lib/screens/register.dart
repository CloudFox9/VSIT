import 'package:flutter/material.dart';
import 'package:secure_auth/screens/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(53, 193, 150, 169),
      appBar: AppBar(
        title: const Text("Secure Auth 3"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),

            // color: Colors.orange,
            child: ElevatedButton(
              style: ButtonStyle(elevation: MaterialStateProperty.all(10)),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("   Login Profile   "),
              ),
              onPressed: () {
                //login PUSH CHEK
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
