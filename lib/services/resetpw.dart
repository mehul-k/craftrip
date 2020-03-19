import 'package:firebase_auth/firebase_auth.dart';


class ResetModel {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> handleForgotPw(var email) async {
    bool success = false;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      success = true;
    } catch(e){
      success = false;
    }

    return success;
  }

}