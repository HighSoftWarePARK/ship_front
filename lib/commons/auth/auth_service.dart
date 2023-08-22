import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'accessToken', value: token);
  }

  Future<void> saveXerk(String token) async {
    await secureStorage.write(key: 'xerk', value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'accessToken');
  }

  Future<String?> getXerk() async {
    return await secureStorage.read(key: 'xerk');
  }
}
