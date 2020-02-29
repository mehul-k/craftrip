import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginModel {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignIn(var email, var password) async {
    FirebaseUser user;
    try {
       user = (await _auth.signInWithEmailAndPassword(
          email: email, password: password)).user;
    } catch(e){
      user = null;
    }

    return user;
  }

}