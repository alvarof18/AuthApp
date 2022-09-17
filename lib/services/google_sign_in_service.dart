import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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
      // print('====================KEY==================');
      // print(googleKey!.idToken);

      final signInWithGoogleEndpoint = Uri(
          scheme: 'https',
          host: 'apple-google-signin-alvarof18.herokuapp.com',
          path: '/google');

      final session = await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey!.idToken});

      print('===============backend==============');
      print(session.body);

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
