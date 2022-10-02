import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

class ProjectProvider {
  // * constructor
  ProjectProvider() : _dio = Dio();

  // * dio
  late Response _response;
  late final Dio _dio;

  // * rest api
  final _baseUrl = "http://192.168.1.14:8000";

  test(List<int> bytes) async {
    // String extension = name.split(".").last;
    try {
      var formData = FormData.fromMap({
        "name": "Harshit",
        "oid": "1231312123123",
        "file": MultipartFile.fromBytes(
          bytes,
          filename: "wires",
          // contentType: MediaType("File", extension),
        ),
      });

      _response = await _dio.post("$_baseUrl/face", data: formData);

      log("test response");
      log(_response.data.toString());
      print("GG");
    } catch (eer) {
      print("DIOOOOO FAILED");
      print(eer);
    }
  }
}
