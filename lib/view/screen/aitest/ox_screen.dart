import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../home/home_screens.dart';
import 'ai_result_screen.dart';

class OXPage extends StatefulWidget {
  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  bool _radioValue = true;
  bool _inputFormValue = false;
  TextEditingController _textEditingController = TextEditingController();

  void setStateButtonValue(value) {
    setState(() {
      _inputFormValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("AI 테스트").getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Divider(
                      //   height: 5,
                      //   thickness: 1,
                      //   indent: 0,
                      //   endIndent: 0,
                      //   color: Colors.black12,
                      // ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   width: 2,
                          //   color: Color(0XFF2434D7),
                          // ),
                          // borderRadius:
                          // BorderRadius.all(Radius.circular(8.0)),
                          color: Color(0xff333333),
                        ),
                        child: Container(
                          height: 460,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 117,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 5.0, 12.0, 0.0),
                                          child: Text(
                                            "AI TEST",
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: Color(0xff444444),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                              Container(
                                height: 340,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24.0, 0.0, 24.0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        Images.ai_test2,
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        // color: Colors.black,
                                      ),
                                    )
                                    // Container(
                                    //     height: MediaQuery.of(context).size.width * 0.9,
                                    //     decoration: BoxDecoration(
                                    //       // border: Border.all(
                                    //       //   width: 2,
                                    //       //   color: Color(0XFF2434D7),
                                    //       // ),
                                    //       borderRadius:
                                    //       BorderRadius.all(Radius.circular(8.0)),
                                    //       color: Colors.blue,
                                    //     ),
                                    //     child: Image.asset(
                                    //       Images.loading_estimate,
                                    //       fit: BoxFit.fitWidth,
                                    //       height: MediaQuery.of(context).size.width * 0.9,
                                    //       width: MediaQuery.of(context).size.width * 0.9,
                                    //       // color: Colors.black,
                                    //     ),
                                    // )
                                    ),
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                      Stack(
                        children: [
                          Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Image.asset(
                                Images.ball2on,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.width * 0.22,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(140.0, 5.0, 12.0, 0.0),
                              child: Text(
                                "피부가 노랗다",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Color(0xffEEEEEE),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => AIResultPage()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "${getTranslated('YES_BUTTON', context)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.all(
                                        //     Radius.circular(50),
                                        //   ),
                                        //   border: Border.all(
                                        //     width: 2,
                                        //     color: Colors.green,
                                        //     style: BorderStyle.solid,
                                        //   ),
                                        // ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Images.yes_bt,
                                                height: 57,
                                                // color: Colors.black,
                                              ),
                                              // Text(
                                              //   "${getTranslated('NO_BUTTON', context)}",
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => AIResultPage()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "${getTranslated('NO_BUTTON', context)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.all(
                                        //     Radius.circular(50),
                                        //   ),
                                        //   border: Border.all(
                                        //     width: 2,
                                        //     color: Colors.green,
                                        //     style: BorderStyle.solid,
                                        //   ),
                                        // ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Images.no_bt,
                                                height: 57,
                                                // color: Colors.black,
                                              ),
                                              // Text(
                                              //   "${getTranslated('START', context)}",
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Text(
                        "폐차 진행 중입니다.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                ),
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2434D7),
                  ),
                ),
              ],
            ));
  }
}
