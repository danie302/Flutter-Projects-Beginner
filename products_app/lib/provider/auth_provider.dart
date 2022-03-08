import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:products_app/repositories/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isLoginValidForm() {
    return loginFormKey.currentState?.validate() ?? false;
  }

  bool isRegisterValidForm() {
    return registerFormKey.currentState?.validate() ?? false;
  }

  Future<String?> login() async {
    final response = await AuthRepo.login(email, password);
    if (response.containsKey('idToken')) {
      await storage.write(key: 'idToken', value: response['idToken']);
      return null;
    } else {
      return response['error']['message'];
    }
  }

  Future<String?> register() async {
    final response = await AuthRepo.createUser(email, password);
    if (response.containsKey('idToken')) {
      return null;
    } else {
      return response['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
  }

  Future<String> getUser() async {
    final idToken = await storage.read(key: 'idToken');
    return idToken ?? '';
  }
}
