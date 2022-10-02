import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;

Future<bool> camera_permit() async {
  if (kIsWeb) {
    // async {
    final perm =
        await html.window.navigator.permissions?.query({"name": "camera"});
    final stream = await html.window.navigator.getUserMedia(video: true);
    return true;
  } else {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    }
    if (status.isDenied) {
      await Permission.camera.request();
      return true;
    } else if (await Permission.camera.isRestricted) {
      print("OS ERROR");
      return false;
    }
    if (await Permission.camera.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    } else {
      return false;
    }
  }
}
