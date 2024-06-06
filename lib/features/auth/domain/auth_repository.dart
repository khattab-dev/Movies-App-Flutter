import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> tryLoginWithEmailAndPassword(String email, String password);
}
