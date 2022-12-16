import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import 'ai_login_screen.dart';
import 'ai_result_screen.dart';

class OXPage extends StatefulWidget {
  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  var testList = [
    "피부가 노랗다",
    "피부가 얇다",
    "피부가 잘 탄다",
    "모발이 까만편이다",
    "머리 숱이 적다",
    "파란색 옷이 잘 어울린다",
    "밝은색 옷이 잘 어울린다",
    "검은색 옷이 잘 어울린다",
    "파스텔 계열 옷이 잘 어울린다",
    "머스타드, 브라운 옷이 잘 어울린다",
    "쨍한 옷이 잘 어울린다",
    "골드가 잘 어울린다",
    "진주가 잘 어울린다",
    "립 컬러가 플럼끼가 있거나 딥한 와인 컬러가 어울린다",
    "립 컬러가 오렌지가 어울린다",
  ];

  int stage = 0;

  List<bool> stageValues = [];

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff333333),
                      ),
                      child: Container(
                        height: 477,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 220),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      topRight: Radius.circular(50.0),
                                    ),
                                    color: Color(0xffffffff),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 140,
                                ),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          // color: Colors.black,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ),
                    ),
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
                              height: MediaQuery.of(context).size.width * 0.22,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              "${testList[stage]}",
                              style: TextStyle(
                                fontSize: stage == 13 ? 15 : 19,
                                color: Color(0xffEEEEEE),
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.center,
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
                                stageValues.add(true);
                                if (stage > 13) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => AILoginPage(),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    stage++;
                                  });
                                }
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
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              Images.yes_bt,
                                              height: 57,
                                            ),
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
                                stageValues.add(false);
                                if (stage > 13) {
                                  // test bool 값을 세팅 완료
                                  // 10가지 중에 하나로 결정
                                  // 0 : 봄 브라이트
                                  // 1 : 봄 브라이트
                                  // 2 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  // 0 : 봄 브라이트
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => AILoginPage(
                                        personalColorType: 0,
                                      ),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    stage++;
                                  });
                                }
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
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              Images.no_bt,
                                              height: 57,
                                            ),
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
                    FooterPage(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
