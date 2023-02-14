import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/consulting_model.dart';
import 'package:yeka/kakao_login.dart';
import 'package:yeka/localization/language_constants.dart';
import 'package:yeka/kakao_view_model.dart';
import 'package:yeka/provider/auth_provider.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';
import 'package:yeka/view/screen/auth/join_screen.dart';

import '../../../apple_login.dart';
import '../../../apple_login_2.dart';
import '../../../apple_view_model.dart';
import '../../../data/model/body/login_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../google_login.dart';
import '../../../google_view_Model.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../aitest/ai_result_screen.dart';
import '../home/home_screens.dart';
import '../product/product_detail_screen.dart';

class AuthScreen extends StatefulWidget {
  final int initialPage;
  final ConsultingModel consultingModel;

  AuthScreen({this.initialPage = 0, this.consultingModel});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Kakao
  final kakaoViewModel = KaKaoViewModel(KakaoLogin());
  OAuthToken token;
  // Google
  final googleViewModel = GoogleViewModel(GoogleLogin());
  // apple
  final appleViewModel = AppleViewModel(AppleLogin());

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('LOGIN', context)}",
                isMyPageHidden: true,
                isLogoutHidden: true,
              ),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            Center(
                              child: Image.asset(
                                Images.logo_b,
                                height: 50,
                                width: 88,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(
                              height: 20,
                              child: TextFormField(
                                onChanged: (value) {},
                                controller: idController,
                                textAlignVertical: TextAlignVertical.bottom,
                                focusNode: usernameFocus,
                                style: TextStyle(fontSize: 13),
                                decoration: InputDecoration(
                                  hintText:
                                      "${getTranslated('INSERT_ID', context)}",
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Image(
                                    image: AssetImage(
                                      Images.login_id,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(
                              height: 20,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                controller: passwordController,
                                onChanged: (value) {},
                                textAlignVertical: TextAlignVertical.bottom,
                                focusNode: passwordFocus,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                                decoration: InputDecoration(
                                  hintText:
                                      "${getTranslated('INSERT_PW', context)}",
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  prefixIcon: Image(
                                    image: AssetImage(
                                      Images.login_pw,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          ],
                        ),
                      ),

                      CustomElevatedButton(
                        onTap: () {
                          usernameFocus.unfocus();
                          passwordFocus.unfocus();

                          LoginModel loginModel = LoginModel(
                            username: idController.text,
                            password: passwordController.text,
                          );

                          Provider.of<AuthProvider>(context, listen: false)
                              .login(loginModel, route);
                        },
                        buttonText: "${getTranslated('LOGIN', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Center(
                          child: Text(
                        "${getTranslated('MEMBER_JOIN_QUESTION', context)}",
                        style:
                            TextStyle(color: Color(0xff9d9d9d), fontSize: 9.0),
                      )),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: CustomOutlinedButton(
                          backgroundColor: Colors.yellow,
                          borderColor: Colors.white,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => JoinScreen()),
                            );
                          },
                          child: InkWell(
                            onTap: () async {
                              try {
                                AccessTokenInfo tokenInfo =
                                    await UserApi.instance.accessTokenInfo();
                                print('${tokenInfo}');
                                print('Kakao login success');
                              } catch (error) {
                                print('액세스 토큰이 존재하지 않습니다. 로그인을 시도합니다.');
                                token = await kakaoViewModel.login();
                                User user = await UserApi.instance.me();

                                // 생성된 유저 정보를 서버로 보내야 함
                                UserModel userModel = UserModel(
                                  id: user.id,
                                  // 10자리
                                  name: user.kakaoAccount.name,
                                  // 권한필요
                                  email: user.kakaoAccount.email,
                                  phone: user.kakaoAccount.phoneNumber,
                                  // 권한필요, 국내 번호인 경우 +82 00-0000-0000 형식
                                  gender: user.kakaoAccount.gender == 'male'
                                      ? 0
                                      : 1, // male, female
                                );

                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .addCustomToken(userModel);

                                if (UserApi.instance.accessTokenInfo() !=
                                    null) {
                                  await Navigator.of(context)
                                      .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (_) => HomePage()),
                                          (route) => false);
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.kakao,
                                  fit: BoxFit.fill,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${getTranslated('LOGIN_WITH_KAKAOTALK', context)}",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: CustomOutlinedButton(
                          backgroundColor: Colors.white,
                          borderColor: Colors.grey[400],
                          onTap: () {},
                          child: InkWell(
                            onTap: () async {
                              await googleViewModel.login();

                              if (googleViewModel.isLogined == true) {
                                await Navigator.of(context)
                                    .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()),
                                        (route) => false);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.google,
                                  fit: BoxFit.fill,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${getTranslated('LOGIN_WITH_GOOGLE', context)}",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                        child: CustomOutlinedButton(
                          backgroundColor: Colors.black,
                          borderColor: Colors.black,
                          onTap: () {},
                          child: InkWell(
                            onTap: () async {
                              await appleViewModel.login();

                              if (googleViewModel.isLogined == true) {
                                await Navigator.of(context)
                                    .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => SampleScreen()),
                                        (route) => false);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.apple,
                                  fit: BoxFit.fill,
                                  height: 20,
                                ),
                                SizedBox(
                                  // width: ,
                                ),
                                Text(
                                  "${getTranslated('LOGIN_WITH_APPLE', context)}",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomOutlinedButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => JoinScreen()),
                            );
                          },
                          buttonText:
                              "${getTranslated('MEMBER_JOIN', context)}",
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      // FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  route(bool isRoute, String errorMessage) async {
    if (isRoute) {
      if (widget.initialPage == 0) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => true);
      } else if (widget.initialPage == 1) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    AIResultPage(consultingModel: widget.consultingModel)),
            (route) => true);
      } else if (widget.initialPage == 2) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => ProductDetailPage()),
            (route) => true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("${getTranslated("CHECK_USER_INFO", context)}"),
            backgroundColor: Colors.red),
      );
    }
  }
}
