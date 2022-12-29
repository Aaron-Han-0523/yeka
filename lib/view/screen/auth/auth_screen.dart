import 'package:yeka/view/screen/auth/join_screen.dart';
import 'package:flutter/material.dart';

import 'package:yeka/localization/language_constants.dart';
import 'package:yeka/provider/auth_provider.dart';

import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';

import 'package:provider/provider.dart';

import '../../../data/model/body/login_model.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../aitest/ai_result_screen.dart';
import '../home/home_screens.dart';
import '../product/product_detail_screen.dart';

class AuthScreen extends StatefulWidget {
  final int initialPage;

  AuthScreen({this.initialPage = 0});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              CustomSliverAppBar("${getTranslated('LOGIN', context)}", isMyPageHidden: true, isLogoutHidden: true,),

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
                                style: TextStyle(fontSize: 13,),
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
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomOutlinedButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
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
      if(widget.initialPage == 0) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => true);
      } else if(widget.initialPage == 1) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => AIResultPage()), (route) => true);
      } else if(widget.initialPage == 2) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => ProductDetailPage()), (route) => true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("사용자 정보가 일치하지 않습니다."), backgroundColor: Colors.red),
      );
    }
  }
}
