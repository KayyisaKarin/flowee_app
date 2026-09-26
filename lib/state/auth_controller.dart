import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ValueNotifier<bool> {
  AuthController._() : super(false);

  static final AuthController instance = AuthController._();

  static const _prefKey = "flowee_is_logged_in";

  // Dipanggil sekali saat aplikasi baru dibuka (Muncul Splash Screen)
  // Untuk membaca status login yang tersimpan dari sesi SEBELUMNYA
  Future<void> loadPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(_prefKey) ?? false;
  }

  Future<void> login() async {
    value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
  }

  Future<void> logout() async {
    value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, false);
  }
}
