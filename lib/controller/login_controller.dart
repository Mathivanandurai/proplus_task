import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:proplus_task/repository/login_repo.dart';
import 'package:proplus_task/utils/shared_preferences.dart';

import '../main_export.dart';

class LoginController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  AppleFullPersonName? appleFullPersonName;
  bool isSuccess = false;

  Future<void> signInWithFirebase(BuildContext context) async {
    isSuccess = false;
    try {
      var ff = await signInWithGitHub(context);

      if (ff?.accessToken != null && (ff?.accessToken ?? "").isNotEmpty) {
        try {
          _firebaseAuth.signInWithCredential(ff!);
        } catch (e) {
          CustomSnackBar.bottomSnackBar("Login Failed");
        }
        isSuccess = true;
        appleFullPersonName = ff!.appleFullPersonName;
        await SharedPreferenceHelper.shared
            .setAccessToken(ff.accessToken ?? "");
        await SharedPreferenceHelper.shared
            .setName(ff.appleFullPersonName?.familyName ?? "");
        CustomSnackBar.bottomSnackBar("Login Successful");
      } else {
        CustomSnackBar.bottomSnackBar("Error");
      }
    } catch (e) {
      CustomSnackBar.bottomSnackBar("$e");
    }
  }

  Future<OAuthCredential?> signInWithGitHub(BuildContext context) async {
    var params = GithubSignInParams(
      clientId: 'Ov23liZx2EsWR4RliK7f',
      clientSecret: '167f88e7b49032ad6f6b32ea587501e82f8532cf',
      redirectUrl: 'https://pro-plus-task.firebaseapp.com/__/auth/handler',
      scopes: 'read:user,user:email,read:org',
    );

    // Push [GithubSigninScreen] to perform login then get the [GithubSignInResponse]
    try {
      var value = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (builder) {
        return GithubSigninScreen(
          params: params,
          headerColor: Colors.green,
          title: 'Login with github',
        );
      }));
      if (value is GithubSignInResponse) {
        var credential = GithubAuthProvider.credential(value.accessToken ?? "");
        return credential;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

}
