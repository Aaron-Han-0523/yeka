

import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:yeka/social_login.dart';

class AppleViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  AuthorizationCredentialAppleID credential;

  AppleViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      isLogined = await _socialLogin.login();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    credential = null;
  }
}