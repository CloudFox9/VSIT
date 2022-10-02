import 'package:flutter/material.dart';

class TrueFace extends StatelessWidget {
  const TrueFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application !"),
      ),
      body: Center(
          child: Column(
        children: const [
          Text("Safe Service"),
          SizedBox(
            height: 20,
          ),
          Text(
              "Safe Service Auth Complete !! Session Cookies were verified by server and you are good to Proceed !!")
        ],
      )),
    );
  }
}
