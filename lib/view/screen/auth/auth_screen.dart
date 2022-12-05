import 'dart:math';

import 'package:yeka/view/screen/auth/join_screen.dart';
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

class AuthScreen extends StatefulWidget {
  final int initialPage;

  AuthScreen({this.initialPage = 0});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
              CustomSliverAppBar("${getTranslated('LOGIN', context)}")
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
                                // textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText:
                                      "${getTranslated('INSERT_ID', context)}",
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 6.0),
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
                                onChanged: (value) {},
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText:
                                      "${getTranslated('INSERT_PW', context)}",
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 6.0),
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
                      // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
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
                          buttonText: "${getTranslated('LOGIN', context)}",
                        ),
                      ),

                      //SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              20.0,
                              0.0,
                              145.0,
                              0.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  // _value = !_value;
                                  // _value1 = _value;
                                  // _value2 = _value;
                                  // _value3 = _value;
                                  //
                                  // if (_value1 && _value2 && _value3)
                                  //   _value = true;
                                  // else
                                  //   _value = false;
                                  // if (_value1 && _value2)
                                  //   _confirmButton = true;
                                  // else
                                  //   _confirmButton = false;
                                });
                              },
                              child: CustomRadioButton(
                                _value1,
                                "${getTranslated('AUTO_LOGIN', context)}",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text("${getTranslated('FIND_ID', context)}",
                              style: TextStyle(fontSize: 9)),
                          ),

                          Text("${getTranslated('FIND_PW', context)}",
                              style: TextStyle(fontSize: 9)),
                        ],
                      ),
                      //SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Center(
                          child: Text(
                            "${getTranslated('MEMBER_JOIN_QUESTION', context)}",
                            style: TextStyle(color: Color(0xff9d9d9d), fontSize: 9.0),
                          )
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomOutlinedButton(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => JoinScreen()));
                          },
                          buttonText:
                              "${getTranslated('MEMBER_JOIN', context)}",
                        ),
                      ),
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
}
