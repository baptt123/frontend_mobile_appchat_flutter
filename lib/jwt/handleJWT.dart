import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HandleJWT{
  final storage = FlutterSecureStorage();

// Lưu JWT vào storage
  Future<void> saveJwt(String token) async {
    await storage.write(key: 'jwt_user', value: token);
  }

// Lấy JWT từ storage
  Future<String?> getJwt() async {
    return await storage.read(key: 'jwt_user');
  }

// Xóa JWT (nếu cần thiết)
  Future<void> deleteJwt() async {
    await storage.delete(key: 'jwt_user');
  }
}