import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<String> readIsSaved(String key) async {
    String value = await storage.read(key: key) ?? 'No data found!';

    return value;
  }

  static writeIsSaved(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
