import 'package:secure_auth/models/user.dart';
import 'package:secure_auth/screens/camera_auth.dart';
import 'package:flutter/material.dart';

import '../network/tokens.dart';

class Home extends StatelessWidget {
  late final String _token;
  late var date;
  late var date2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Auth 3"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welcome"),
          // const SizedBox(
          //   width: 10,
          //   height: 40,
          // ),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              // color: Colors.orange,
              child: ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(10)),
                child: const Text("Quick Login"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaceFetch()),
                  );
                },
              )),
        ],
      )),
    );
  }
}
