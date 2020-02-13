import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignService {
  GoogleSignIn _googleSignIn;

  GoogleSignService()
      : _googleSignIn = GoogleSignIn(scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ]);

  Future<GoogleSignInAccount> handleSignIn() async {
    return await _googleSignIn.signIn();
  }

  Future<GoogleSignInAccount> logOut() async{
    return await _googleSignIn.signOut();
  }
}
