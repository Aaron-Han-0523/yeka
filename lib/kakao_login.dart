import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:yeka/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if(isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (error) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          return false;
        }
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  // TODO: implement loginMedium
  String get loginMedium => throw UnimplementedError();

  @override
  // TODO: implement status
  bool get status => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}