
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yeka/social_login.dart';

class GoogleViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  GoogleSignInAccount googleUser;

  GoogleViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    googleUser = null;
  }
}