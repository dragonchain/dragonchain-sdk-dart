library dragonnchain_sdk;

import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

final logger = new Logger();
final storage = new FlutterSecureStorage();

/// Service object responsible for managing credentials for Dragonchain.
class ConfigService {
  static Future<Map<String, String>> setDragonchainCredentials(String dragonchainId, String authKeyId, String authKey) async {
    await storage.write(key: "authKeyId:$dragonchainId", value: authKeyId);
    await storage.write(key: "authKey:$dragonchainId", value: authKey);
    return {authKeyId: authKeyId, authKey: authKey};
  }

  static Future<Map<String, String>> getDragonchainCredentials(String dragonchainId) async {
    logger.d(storage);
    String authKeyId = await storage.read(key: "authKeyId:$dragonchainId");
    logger.d('AKID: $authKeyId');
    String authKey = await storage.read(key: "authKey:$dragonchainId");
    if (authKeyId == null || authKey == null) {
      throw Exception("Failed to find saved credentials for $dragonchainId");
    }
    return {authKeyId: authKeyId, authKey: authKey};
  }

  static Future<String> getDragonchainEndpoint(String dragonchainId) async {
    try {
      final request = await new HttpClient().getUrl(Uri.parse("https://matchmaking.api.dragonchain.com/v1/registrations/$dragonchainId"));
      var response = await request.close();
      logger.d(response);
      if (response.statusCode == 200) {
        var responseBody = {};
        await for (var contents in response.transform(Utf8Decoder())) {
          responseBody = jsonDecode(contents);
        }
        return responseBody["url"];
      } else {
        throw Exception('Failed to get dragocnhain endpoint with matchmaking');
      }
    } catch (e) {
      logger.e(e);
      throw Exception('Failed to get dragocnhain endpoint with matchmaking');
    }
  }
}
