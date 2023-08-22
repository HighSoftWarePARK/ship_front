import 'dart:convert';

import 'package:sip_app/modules/auth/models/auth_model.dart';

AuthModel parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('Invalid payload');
  }

  final UserRoleConverter converter = UserRoleConverter();
  final AuthModel authModel = AuthModel(
      identyKey: payloadMap['identyKey'],
      role: converter.fromJson(payloadMap['auth']),
      userUUID: payloadMap['userUUID']);

  return authModel;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
