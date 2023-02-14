import 'package:google_sign_in/google_sign_in.dart';
import 'package:yeka/social_login.dart';

class GoogleLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      // 구글 로그인
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        if (googleUser != null) {
          print('구글 로그인 성공');
          print('name = ${googleUser.displayName}');
          print('email = ${googleUser.email}');
          print('id = ${googleUser.id}');
        }
        return true;
      } catch (e) {
        // 구글 로그인 실패
          print('구글 계정으로 로그인 실패 $e');
          return false;
      }
  }

  @override
  Future<bool> logout() async {
    try {
      await GoogleSignIn().signOut();
      print('구글 로그아웃 성공');
      return true;
    } catch (e) {
      print('구글 로그아웃 실패 $e');
      return false;
    }
  }

}