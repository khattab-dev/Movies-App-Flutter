import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/features/auth/domain/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _pref = GetIt.I.get<SharedPreferences>();

  @override
  Future<User?> tryLoginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final token = await userCredential.user?.getIdToken();

      await _pref.setString("identity", token!);

      final identity = _pref.getString("identity");

      print(identity);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
