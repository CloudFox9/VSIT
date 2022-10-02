import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> login(String username, String passw) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://localhost:4000/api/auth/login'));
    request.body = json.encode({"username": username, "password": passw});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonvar = await response.stream.bytesToString();
      return json.decode(jsonvar)["success"];
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
