import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/images.dart';
import 'ai_login_screen.dart';
import 'ai_result_screen.dart';

class OXPage extends StatefulWidget {
  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  var testList = [];

  int stage = 0;

  List<bool> stageValues = [];

  @override
  void initState() {
    testList.add("${getTranslated('TEST_QNA1', context)}");
    testList.add("${getTranslated('TEST_QNA2', context)}");
    testList.add("${getTranslated('TEST_QNA3', context)}");
    testList.add("${getTranslated('TEST_QNA4', context)}");
    testList.add("${getTranslated('TEST_QNA5', context)}");
    testList.add("${getTranslated('TEST_QNA6', context)}");
    testList.add("${getTranslated('TEST_QNA7', context)}");
    testList.add("${getTranslated('TEST_QNA8', context)}");
    testList.add("${getTranslated('TEST_QNA9', context)}");
    testList.add("${getTranslated('TEST_QNA10', context)}");
    testList.add("${getTranslated('TEST_QNA11', context)}");
    testList.add("${getTranslated('TEST_QNA12', context)}");
    testList.add("${getTranslated('TEST_QNA13', context)}");
    testList.add("${getTranslated('TEST_QNA14', context)}");
    testList.add("${getTranslated('TEST_QNA15', context)}");

    super.initState();
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
              CustomSliverAppBar("${getTranslated('AI_test_ko', context)}"),

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

                                personalColorResult(stageValues);

                                if (stage > 13) {
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

  void personalColorResult(List<bool> stageValues) {
    int season = 0;
    int detailSeasonType = 0;

    // 조건 입력
    if (stageValues[0] == true &&
        stageValues[1] == true &&
        stageValues[2] == true &&
        stageValues[3] == true &&
        stageValues[4] == true &&
        stageValues[8] == false &&
        stageValues[10] == true &&
        stageValues[11] == true &&
        stageValues[12] == false &&
        stageValues[13] == true) {
      season = 0;
      detailSeasonType = 0; // 봄 브라이트
    } else if (stageValues[0] == true &&
        stageValues[1] == true &&
        stageValues[2] == true &&
        stageValues[3] == true &&
        stageValues[4] == true &&
        stageValues[5] == false &&
        stageValues[6] == true &&
        stageValues[7] == false &&
        stageValues[8] == true &&
        stageValues[9] == false &&
        stageValues[10] == false) {
      season = 0;
      detailSeasonType = 1; // 봄 라이트
    } else if (stageValues[0] == false &&
        stageValues[1] == true &&
        stageValues[2] == false &&
        stageValues[3] == true &&
        stageValues[4] == true &&
        stageValues[5] == true &&
        stageValues[6] == true &&
        stageValues[8] == false &&
        stageValues[9] == false &&
        stageValues[10] == true &&
        stageValues[11] == false &&
        stageValues[13] == false) {
      season = 1;
      detailSeasonType = 0; // 여름 브라이트
    } else if (stageValues[0] == false &&
        stageValues[1] == true &&
        stageValues[2] == false &&
        stageValues[3] == true &&
        stageValues[4] == true &&
        stageValues[6] == true &&
        stageValues[7] == false &&
        stageValues[8] == true &&
        stageValues[9] == false &&
        stageValues[10] == false &&
        stageValues[11] == false &&
        stageValues[12] == true &&
        stageValues[13] == false) {
      season = 1;
      detailSeasonType = 1; // 여름 라이트
    } else if (stageValues[0] == false &&
        stageValues[1] == true &&
        stageValues[2] == false &&
        stageValues[3] == true &&
        stageValues[4] == true &&
        stageValues[6] == true &&
        stageValues[7] == false &&
        stageValues[9] == false &&
        stageValues[10] == false &&
        stageValues[11] == false &&
        stageValues[12] == true &&
        stageValues[13] == false) {
      season = 1;
      detailSeasonType = 4; // 여름 뮤트
    } else if (stageValues[0] == true &&
        stageValues[1] == false &&
        stageValues[2] == true &&
        stageValues[3] == false &&
        stageValues[4] == false &&
        stageValues[5] == false &&
        stageValues[6] == false &&
        stageValues[7] == true &&
        stageValues[8] == false &&
        stageValues[9] == true &&
        stageValues[10] == false &&
        stageValues[11] == true &&
        stageValues[12] == false &&
        stageValues[13] == true &&
        stageValues[14] == false) {
      season = 2;
      detailSeasonType = 2; // 가을 딥
    } else if (stageValues[0] == true &&
        stageValues[1] == false &&
        stageValues[2] == true &&
        stageValues[3] == false &&
        stageValues[4] == false &&
        stageValues[8] == false &&
        stageValues[9] == true &&
        stageValues[10] == true &&
        stageValues[11] == true &&
        stageValues[12] == false &&
        stageValues[13] == false) {
      season = 2;
      detailSeasonType = 3; // 가을 스트롱
    } else if (stageValues[0] == true &&
        stageValues[1] == false &&
        stageValues[2] == true &&
        stageValues[3] == false &&
        stageValues[4] == false &&
        stageValues[5] == false &&
        stageValues[7] == false &&
        stageValues[8] == false &&
        stageValues[9] == true &&
        stageValues[10] == false &&
        stageValues[12] == false &&
        stageValues[13] == false &&
        stageValues[14] == false) {
      season = 2;
      detailSeasonType = 4; // 가을 뮤트
    } else if (stageValues[1] == false &&
        stageValues[2] == false &&
        stageValues[4] == false &&
        stageValues[5] == true &&
        stageValues[6] == true &&
        stageValues[7] == true &&
        stageValues[8] == false &&
        stageValues[9] == false &&
        stageValues[10] == true &&
        stageValues[11] == false &&
        stageValues[12] == false &&
        stageValues[13] == false &&
        stageValues[14] == false) {
      season = 3;
      detailSeasonType = 0; //겨울 브라이트
    } else if (stageValues[1] == false &&
        stageValues[2] == false &&
        stageValues[4] == false &&
        stageValues[5] == true &&
        stageValues[7] == true &&
        stageValues[8] == false &&
        stageValues[9] == false &&
        stageValues[11] == false &&
        stageValues[12] == false &&
        stageValues[13] == true &&
        stageValues[14] == false) {
      season = 3;
      detailSeasonType = 2; // 겨울 딥
    }

    // input : season and detailSeasonType

    // output : personalColorType

    if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => AILoginPage(
            season: 0,
            detailSeasonType: 0,
          ),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => AIResultPage(
            season: 0,
            detailSeasonType: 0,
          ),
        ),
      );
    }
  }
}
