import 'dart:math';

import 'package:yeka/view/screen/auth/widget/sign_in_widget.dart';
import 'package:yeka/view/screen/auth/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';

import 'package:yeka/localization/language_constrants.dart';
import 'package:yeka/provider/auth_provider.dart';

// import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';

// import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_in_widget.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/auth/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';

import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';
import '../../basewidget/textfield/custom_alert_text_textfield.dart';
import '../home/widget/footer_screens.dart';

class JoinScreen extends StatefulWidget {
  final int initialPage;

  JoinScreen({this.initialPage = 0});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  TextEditingController idController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _value1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('MEMBER_JOIN', context)}")
                  .getAppbar(),

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
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:
                                    Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    Images.logo_b,
                                    height: 28,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "에 오신",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      " 여러분 ",
                                      style: TextStyle(
                                        // color: Color(0xff0123b4),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "을 환영합니다 !",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "회원가입은",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "무료",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "이며,",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "절차에 따라 가입하시면 서비스를 이용하실 수 있습니다.",
                                  style: TextStyle(
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            SignUpWidget(),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          ],
                        ),
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomElevatedButton(
                          onTap: () {
                            // ClientsModel clientsModel = ClientsModel(
                            //   phoneNum: phoneNumberTextEditingController.text,
                            //   password: passwordTextEditingController.text,
                            // );
                            //
                            // Provider.of<ClientsProvider>(context, listen: false)
                            //     .login(clientsModel, route);
                          },
                          buttonText: "${getTranslated('MEMBER_JOIN', context)}",
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),


                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
