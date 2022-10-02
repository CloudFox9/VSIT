import 'dart:async';
import 'package:secure_auth/network/api.dart';
import 'package:secure_auth/network/permits.dart';
import 'package:secure_auth/screens/face.dart';
import 'package:secure_auth/screens/success_face.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

late List<CameraDescription> cameras;

class FaceFetch extends StatefulWidget {
  FaceFetch({super.key});

  @override
  State<FaceFetch> createState() => _FaceFetchState();
}

class _FaceFetchState extends State<FaceFetch> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  bool _isloading = true;

  void camer() async {
    bool access = await camera_permit();
    if (access) {
      cameras = await availableCameras();
      setState(() {
        _cameraController = CameraController(cameras.first,
            kIsWeb ? ResolutionPreset.low : ResolutionPreset.medium,
            enableAudio: true);
        cameraValue = _cameraController.initialize();
        _isloading = false;
      });
    } else {
      const SnackBar(content: Text("Could Not Access Camera"));
      setState(() {
        _isloading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    camer();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authorization() async {
      XFile videopath = await _cameraController.stopVideoRecording();
      print(videopath.path);
      final bool response = await face(videopath);
      if (response) {
        _cameraController.dispose();

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TrueFace()),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Authoriztion Failed Please Retry", timeInSecForIosWeb: 30);
        // ignore: use_build_context_synchronously
        if (kIsWeb) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FaceSpeech(title: "Gateway 2 Failed")),
          );
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      }
    }

    return Scaffold(
      body: _isloading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Processing ....."),
                  CircularProgressIndicator(),
                ],
              ),
            )
          : AbsorbPointer(
              absorbing: isRecoring,
              child: Stack(
                children: [
                  Container(
                    color: Colors.blueGrey,
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: FutureBuilder(
                            future: cameraValue,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: CameraPreview(
                                      _cameraController,
                                      child: Positioned(
                                        bottom: 0.0,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () async {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Authorzation Started Please wait while we authorize",
                                                            timeInSecForIosWeb:
                                                                7);
                                                        await _cameraController
                                                            .startVideoRecording();
                                                        Fluttertoast.showToast(
                                                            msg: "Please wait");
                                                        setState(() {
                                                          isRecoring = true;
                                                        });
                                                        await Future.delayed(
                                                            const Duration(
                                                                seconds: 7));
                                                        setState(() {
                                                          authorization();
                                                          _isloading = true;
                                                        });
                                                      },

                                                      //push
                                                      child: isRecoring
                                                          ? Container()
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      25.0),
                                                              child: Container(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    11,
                                                                    33,
                                                                    66),
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        15,
                                                                        10,
                                                                        15,
                                                                        10),
                                                                child:
                                                                    const Text(
                                                                  "Begin Authorization",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            )),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              } else {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "On it",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
