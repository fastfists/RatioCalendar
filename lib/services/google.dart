import 'package:google_sign_in/google_sign_in.dart';


class GoogleAuth {

  var _google = GoogleSignIn(
    scopes: [
      "email",
      "https://www.googleapis.com/auth/calendar.events.readonly",
    ]
  );

  singInWtihGoogle() async {
    GoogleSignInAccount signIn = (await _google.signIn());
    print(signIn);
    var auth = await signIn.authentication;
    print((auth).idToken);
    print((auth).accessToken);
    print((auth).serverAuthCode);
    print("tokens above");
  }

}