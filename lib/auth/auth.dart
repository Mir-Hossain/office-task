import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  Future registration(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Registration Successfull');
      } else {
        Fluttertoast.showToast(msg: "Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }

  Future login(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);

      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Login Successfull');
      } else {}
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> registerWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential.additionalUserInfo!.isNewUser) {
          // This is a new user, perform any additional registration steps here
          print('New user registered with Google');
        } else {
          // This user has already been registered
          print('Existing user signed in with Google');
        }
      }
    } catch (e) {
      print('Error during Google Registration: $e');
    }
  }

  FacebookAuth facebookAuth = FacebookAuth.instance;

  Future<void> signInWithFacebook() async {
    try {
      final AccessToken? accessToken =
          (await facebookAuth.login()) as AccessToken?;
      if (accessToken != null) {
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        if (userCredential.additionalUserInfo!.isNewUser) {
          // This is a new user, perform any additional registration steps here
          print('New user registered with Facebook');
        } else {
          // This user has already been registered
          print('Existing user signed in with Facebook');
        }
      }
    } catch (e) {
      print('Error during Facebook Sign-In: $e');
    }
  }

  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );

  //       UserCredential userCredential =
  //           await _auth.signInWithCredential(credential);

  //       if (userCredential.user != null) {
  //         Fluttertoast.showToast(msg: 'Google Sign-In successful');
  //       }
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'Error during Google Sign-In: $e');
  //   }
  // }
}
