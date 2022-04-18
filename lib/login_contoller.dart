//import 'dart:js';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home/home.dart';

//import 'package:lottie/lottie.dart';

class LoginController extends GetxController {
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  // late AnimationController _lottieAnimation;
  // var expanded = false;

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }

  next() {
    Widget build(BuildContext context) {
      return Scaffold(
        //appBar: AppBar(title: Text('Home Screen')),
        body: Center(
          child: RaisedButton(
            // child: Text(
            //   'Navigate to a new screen >>',
            //   style: TextStyle(fontSize: 24.0),
            // ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
      );
    }

    //googleAccount.value = await _googleSignin.signOut();
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    //   Widget build(BuildContext context) {
    //   return Scaffold(
    //     // appBar: AppBar(
    //     //   title: const Text('First Route'),
    //     // ),
    //     body: Center(
    //       child: Column(
    //         //child: const Text('Open route'),
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => HomePage()),
    //           );
    //         },
    //       ),
    //     ),
    //   //);
    // }
  }
}


// // function to implement the google signin

// // creating firebase instance
// final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
// 	final GoogleSignIn googleSignIn = GoogleSignIn();
// 	final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
// 	if (googleSignInAccount != null) {
// 	final GoogleSignInAuthentication googleSignInAuthentication =
// 		await googleSignInAccount.authentication;
// 	final AuthCredential authCredential = GoogleAuthProvider.credential(
// 		idToken: googleSignInAuthentication.idToken,
// 		accessToken: googleSignInAuthentication.accessToken);
	
// 	// Getting users credential
// 	UserCredential result = await auth.signInWithCredential(authCredential);
// 	User user = result.user;
	
// 	if (result != null) {
// 		Navigator.pushReplacement(
// 			context, MaterialPageRoute(builder: (context) => HomePage()));
// 	} // if result not null we simply call the MaterialpageRoute,
// 		// for go to the HomePage screen
// 	}
// }
