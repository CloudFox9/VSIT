import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:camera/camera.dart';

Future<bool> face(XFile path_face) async {
  // final prefs = await SharedPreferences.getInstance();
  // final String? token = prefs.getString('token');
  // BobUser user = decode_token(token);

  if (kIsWeb) {
    try {
      print("DONE");
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://139.84.164.241/face'));
      request.fields.addAll({'oid': "1111", 'name': "Undersc0re"});
      request.files.add(http.MultipartFile.fromBytes(
          "file", await path_face.readAsBytes(),
          filename: '${path_face.path}${path_face.name}.webm'));
      request.headers.clear();
      var respons = await request.send();
      if (respons.statusCode == 200) {
        String data = await respons.stream.bytesToString();
        var auth = json.decode(data)["status"];
        if (auth.toString() == "auth") {
          return true;
        } else {
          return false;
        }
      } else {
        print("Error In status code");
        return false;
      }
    } catch (err) {
      print("Error was seen");
      print(err.toString());
      return false;
    }
  } else {
    try {
      print("Session Start");
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://139.84.164.241/face'));
      request.fields.addAll({
        'oid': "d23edd7a-b716-44a3-8431-c728585daabc",
        'name': "Undersc0re"
      });
      // request.files.add(await http.MultipartFile.fromPath('file', path_face));
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        path_face.path,
      ));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String auth = await response.stream.bytesToString();
        var stats = json.decode(auth)["status"];
        if (stats.toString() == "auth") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
