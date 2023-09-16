import 'package:firebase_auth/firebase_auth.dart';
import 'package:n_eventify/model/user_model.dart';

class AuthServices {
  //Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? userWithFirebaseUserUid(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }
  //Create Stream
  Stream<UserModel?> get user{
    return _auth.authStateChanges().map(userWithFirebaseUserUid);
  }
  //Sign in Anonymous
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
