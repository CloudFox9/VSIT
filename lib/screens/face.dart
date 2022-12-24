import 'dart:html';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:secure_auth/screens/camera_auth.dart';
import 'package:flutter/material.dart';

class FaceSpeech extends StatefulWidget {
  final String title;

  FaceSpeech({this.title = "Gateway 1 Passed"});

  @override
  State<FaceSpeech> createState() => _FaceSpeechState();
}

class _FaceSpeechState extends State<FaceSpeech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 150, top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Session File will be created for normal flows are resued normally , secured by a clumsy 2FA of One-Time-Passcode\nBut we change it to verify yourself so no need to wait for OTP ! Simple yet Safe\n\n Note : Make sure enough light on face and low noise in the background',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.grey[300]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                timeInSecForIosWeb: 10,
                                webPosition: "right",
                                backgroundColor: Colors.blueGrey,
                                msg:
                                    "Developed By Hackathon Team : Undersc0re");
                          },
                          child: const SizedBox(
                            height: 50,
                            width: 170,
                            child: Center(
                              child: Text(
                                'Gateway 2 : ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FaceFetch()));
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.blueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                'Verify Face/Speech',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 2, child: Card()),
            ],
          ),
        ),
      ),
    );
  }
}
