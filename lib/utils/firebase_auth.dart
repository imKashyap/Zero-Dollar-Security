import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  String name, email,uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );
  Future<String> createUserWithEmail(
      String email, String password, String name) async {
    final currentUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.user.updateProfile(userUpdateInfo);
    await currentUser.user.reload();
    return currentUser.user.uid;
  }

  Future<String> signInWithEmail(String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  Future sendPasswordEmail(String email)async{
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String> loginWithGoogle() async {
      GoogleSignInAccount account = await googleSignIn.signIn();
      AuthResult res = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: (await account.authentication).idToken,
              accessToken: (await account.authentication).accessToken));
      return res.user.uid;
  }
  Future<FirebaseUser> getCurrentUser()async {
  return await _auth.currentUser();
  }
  signOut(){
    return _auth.signOut();
  }

}
