import 'package:flutter/material.dart';
import 'package:shift_app/models/repositories/login_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel({required AuthService authService})
      : _authService = authService;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<String?> signIn(String email, String password) async {
    startLoading();
    try {
      await _authService.signIn(email, password);
      endLoading();
      return null; // 認証成功時は null を返す
    } catch (e) {
      endLoading();
      return e.toString(); // エラーが発生した場合はエラーメッセージを返す
    }
  }

  Future<String?> signUp(String email, String pass) async {
    startLoading();
    try {
      await _authService.signUp(email, pass);
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      endLoading();
    }
  }
}