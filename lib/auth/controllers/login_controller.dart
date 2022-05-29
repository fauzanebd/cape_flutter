import 'package:cape_flutter/Auth/controllers/load_auth_controller.dart';
import 'package:cape_flutter/Auth/views/custom_load_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  LoadAuthController loadAuthController = Get.find<LoadAuthController>();

  // @override
  // void onInit() async {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}

  void login() async {
    CustomLoadDialog.showDialog();
    // print("about to call google sign in from load auth controller");
    try {
      GoogleSignInAccount? googleSignInAccount =
          await loadAuthController.googleSignIn.signIn();

      if (googleSignInAccount == null) {
        CustomLoadDialog.cancelDialog();
      } else {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await loadAuthController.firebaseAuth
            .signInWithCredential(oAuthCredential);
        CustomLoadDialog.cancelDialog();
      }
    } on PlatformException catch (e) {
      Get.snackbar("Error Login", e.message!);
    } on Exception catch (e) {
      Get.snackbar("Error Login", e.toString());
    }
  }
}
