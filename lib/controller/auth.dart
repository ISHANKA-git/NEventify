import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnonymously() async{
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return user;

  }
}