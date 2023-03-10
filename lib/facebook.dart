import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});
  ///====================>flutter_facebook_auth===================///

//  facebookLogin() async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print(userData);
//       }
//     } catch (error) {
//       print(error);
//     }
//   }






///===================>flutter_login_facebook========package use==========///
facebookLogin()async{
final fb = FacebookLogin();
// Log in
final res = await fb.logIn(permissions: [
  FacebookPermission.publicProfile,
  FacebookPermission.email,
]);

switch (res.status) {
  case FacebookLoginStatus.success:
    
    final FacebookAccessToken ?accessToken = res.accessToken; // get access token 
     final profile = await fb.getUserProfile(); //get user profile
     final imageUrl = await fb.getProfileImageUrl(width: 100); // get user profile image
      final email = await fb.getUserEmail(); // get user email address
    print('Access token: ${accessToken?.token}');
    print('Hello, ${profile!.name}! You ID: ${profile.userId}');
    print('Your profile image: $imageUrl');

    
    if (email != null)
      print('And your email is $email');

    break;
  case FacebookLoginStatus.cancel:

    break;
  case FacebookLoginStatus.error:
    
    print('Error while log in: ${res.error}');
    break;
}
///====================UI part Start=============///
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          facebookLogin();
        }, child: const Text("Login with Facebook"))
      ),
    );
  }
}