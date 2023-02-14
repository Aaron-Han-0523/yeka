import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:yeka/social_login.dart';

class AppleLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      // apple 로그인
      final AuthorizationCredentialAppleID credential =
      await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: "Apple Developer 에서 설정한 Service ID",
          redirectUri: Uri.parse(
            "Apple Developer 에서 설정한 redirectUri",
          ),
        ),
      );

      print('credential.state = $credential');
      print('credential.state = ${credential.email}');
      print('credential.state = ${credential.userIdentifier}');

      return true;
    } catch (error) {
      print('error = $error');
      return false;
    }
  }

  @override
  // 애플 로그인은 다른 소셜 로그인 처럼 로그아웃 처리가 없고 사용자가 직접 앱과 계정의 연결을 끊어야 함.
  Future<bool> logout() async {
    try {
      // print('애플 로그아웃 성공');
      return true;
    } catch (e) {
      // print('애플 로그아웃 실패 $e');
      return false;
    }
  }

}
