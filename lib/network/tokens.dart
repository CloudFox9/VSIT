import 'package:secure_auth/models/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

BobUser decode_token(token) {
  String yourToken = token;
  Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
  print(decodedToken.keys);
  BobUser user = BobUser.fromJson(decodedToken);
  return user;
}

bool expired(token) {
  print(JwtDecoder.getRemainingTime(token));
  return JwtDecoder.isExpired(token);
}
