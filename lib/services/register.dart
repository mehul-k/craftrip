import 'package:craftrip_app/services/collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignUp(var firstname, var lastname, var email, var password) async {

    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password)).user;
    } catch(e){
      user = null;
    }

    if(user!=null){
      Firestore.instance.collection('users').document(user.uid).setData({ 'uid': user.uid, 'firstame': firstname, 'lastname': lastname });
    }

    return user;
  }




}