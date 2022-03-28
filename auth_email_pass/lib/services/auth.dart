import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> registration(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'email-already-in-use';
      } else if (e.code == 'invalid-email') {
        return 'invalid-email';
      } else if (e.code == 'operation-not-allowed') {
        return 'operation-not-allowed';
      } else if (e.code == 'weak-password') {
        return 'weak-password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return 'invalid-email';
      } else if (e.code == 'user-disabled') {
        return 'user-disabled';
      } else if (e.code == 'user-not-found') {
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        return 'wrong-password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
