import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  // google sign in
  signInWithGoogle() async {
    await Firebase.initializeApp(); // Initialize Firebase app

    // Begin interactive sign-in process
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '699424596579-uvlk340uqevekdtgp25ead50172d6m9o.apps.googleusercontent.com',
    );
    final GoogleSignInAccount? gUser = await googleSignIn.signInSilently();

    if (gUser == null) {
      // If the user is not signed in silently, show the sign-in button
      await googleSignIn.signIn();
    }

    // Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign in with Firebase method
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
