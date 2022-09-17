import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication;
      print('====================KEY==================');
      print(googleKey!.idToken);

      return account;
    } catch (e) {
      print('Error en SignIn');
      print(e);
      return null;
    }
  }

  static Future<GoogleSignInAccount?> signOut() async {
    await _googleSignIn.signOut();
  }
}
