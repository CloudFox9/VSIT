// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secure_auth/network/login.dart';
import 'package:secure_auth/screens/face.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _user = TextEditingController();
  TextEditingController _passw = TextEditingController();
  bool isVisible = false;
  bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Regular Login For Any Service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Traditional Authentication',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.grey[300]),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Card(
                              color: Colors.grey.withOpacity(.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: _user,
                                  decoration: InputDecoration(
                                      labelText: '  User Name',
                                      prefix: const SizedBox(width: 10),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.email,
                                          color: Colors.grey[300],
                                        ),
                                        onPressed: () {},
                                      ),
                                      labelStyle:
                                          TextStyle(color: Colors.grey[300]),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: Colors.grey.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: _passw,
                                obscureText: !isVisible,
                                decoration: InputDecoration(
                                    labelText: '   Password',
                                    prefix: const SizedBox(width: 10),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[300],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                    ),
                                    labelStyle:
                                        TextStyle(color: Colors.grey[300]),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Developed By Hackathon Team : Se7enCode");
                                },
                                child: Container(
                                  height: 50,
                                  width: 170,
                                  child: const Center(
                                    child: Text(
                                      'Team : Se7enCode',
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
                                onTap: () async {
                                  setState(() {
                                    _isloading = true;
                                  });
                                  bool auth =
                                      await login(_user.text, _passw.text);
                                  if (auth) {
                                    setState(() {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FaceSpeech()),
                                      );
                                    });
                                  } else {
                                    setState(() {
                                      _passw.clear();
                                      _user.clear();
                                      _isloading = false;
                                      Fluttertoast.showToast(
                                          msg:
                                              "Authentication Failure ! On easy level :)",
                                          timeInSecForIosWeb: 10);
                                    });
                                  }
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
                                      'Create Session',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(flex: 2, child: Card())
                  ],
                ),
              ),
            ),
    );
  }
}
