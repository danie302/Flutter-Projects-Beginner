import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepo {
  static String baseUrl = 'identitytoolkit.googleapis.com';
  static String firebaseToken = 'AIzaSyD-VQlWlWwYhq6UqQXWuz1SFY643K65z1s';

  static Future<Map> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(baseUrl, '/v1/accounts:signInWithPassword', {
      'key': firebaseToken,
    });

    final response = await http.post(url, body: json.encode(authData));
    final decodedRes = json.decode(response.body);
    return decodedRes;
  }

  static Future<Map> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https(baseUrl, '/v1/accounts:signUp', {
      'key': firebaseToken,
    });

    final response = await http.post(url, body: json.encode(authData));
    final decodedRes = json.decode(response.body);
    return decodedRes;
  }
}
