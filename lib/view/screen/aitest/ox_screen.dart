import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../util//images.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import '../consultant/consultant_list_screen.dart';
import '../home/home_screens.dart';
import 'ai_result_screen.dart';

class OXPage extends StatefulWidget {
  final ConsultingModel consultingModel;

  const OXPage({Key key, this.consultingModel}) : super(key: key);

  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  var seasonTestList = [];
  var springTestList = [];
  var summerTestList = [];
  var fallTestList = [];
  var winterTestList = [];

  List<bool> stageValues = [];

  // 계절을 판단하는데 필요한 설문 데이터 리스트(1, 2, 3, 4) ===> 최다빈도가 그 시즌으로 결정
  List<int> seasonValues = [0, 0, 0, 0];
  List<int> detailSeasonValues = [0, 0, 0];

  int stage = 0;

  int season = -1;
  int detailSeasonType = -1;

  @override
  Widget build(BuildContext context) {
    seasonTestList = [];
    springTestList = [];
    summerTestList = [];
    fallTestList = [];
    winterTestList = [];

    seasonTestList.add("${getTranslated('SEASON_QNA1', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA2', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA3', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA4', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA5', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA6', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA7', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA8', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA9', context)}");
    seasonTestList.add("${getTranslated('SEASON_QNA10', context)}");

    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA1', context)}");
    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA2', context)}");
    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA3', context)}");
    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA4', context)}");
    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA5', context)}");
    springTestList
        .add("${getTranslated('DETAIL_SEASON_SPRING_QNA6', context)}");

    summerTestList
        .add("${getTranslated('DETAIL_SEASON_SUMMER_QNA1', context)}");
    summerTestList
        .add("${getTranslated('DETAIL_SEASON_SUMMER_QNA2', context)}");
    summerTestList
        .add("${getTranslated('DETAIL_SEASON_SUMMER_QNA3', context)}");
    summerTestList
        .add("${getTranslated('DETAIL_SEASON_SUMMER_QNA4', context)}");
    summerTestList
        .add("${getTranslated('DETAIL_SEASON_SUMMER_QNA5', context)}");

    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA1', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA2', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA3', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA4', context)}");

    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA1', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA2', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA3', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA4', context)}");

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            CustomSliverAppBar("${getTranslated('AI_TEST', context)}"),

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
                                12.0,
                                5.0,
                                12.0,
                                0.0,
                              ),
                              child: Text(
                                "${getTranslated('AI_TEST_EN', context)}",
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
                                    child: Image.file(
                                      File(
                                        widget.consultingModel.client_image,
                                      ),
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.85,
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      // color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        ],
                      ),
                    ),
                  ),
                  // Stack(
                  //   children: [
                  //     Container(
                  //       height: 60,
                  //       child: Padding(
                  //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //         child: Image.asset(
                  //           Images.ball2on,
                  //           fit: BoxFit.fill,
                  //           width: MediaQuery.of(context).size.width * 0.9,
                  //           height: MediaQuery.of(context).size.width * 0.22,
                  //         ),
                  //       ),
                  //     ),
                  //
                  //
                  //   ],
                  // ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40,
                            child: Center(
                              child: Text(
                                "${seasonTestList[stage].split('|')[0]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          for (var i = 1;
                              i < seasonTestList[stage].split("|").length;
                              i++)
                            ElevatedButton(
                              onPressed: () async {
                                switch (stage) {
                                  case 0:
                                  case 9:
                                    if (i == 1) {
                                      seasonValues[0]++;
                                      seasonValues[2]++;
                                    } else {
                                      seasonValues[1]++;
                                      seasonValues[3]++;
                                    }
                                    break;
                                  case 1:
                                  case 2:
                                  case 4:
                                    if (i == 1) {
                                      seasonValues[0]++;
                                      seasonValues[1]++;
                                    } else {
                                      seasonValues[2]++;
                                      seasonValues[3]++;
                                    }
                                    break;
                                  case 3:
                                  case 5:
                                  case 6:
                                  case 7:
                                  case 8:
                                    if (i == 1) {
                                      seasonValues[0]++;
                                    } else if (i == 2) {
                                      seasonValues[1]++;
                                    } else if (i == 3) {
                                      seasonValues[2]++;
                                    } else {
                                      seasonValues[3]++;
                                    }
                                    break;
                                }

                                if (stage > seasonTestList.length - 2) {
                                  await seasonColorResult(seasonValues);
                                } else {
                                  setState(() {
                                    stage++;
                                  });
                                }
                                print(
                                    '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ${seasonValues}');
                                print(
                                    '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ');
                              },
                              child: Text(
                                  seasonTestList[stage].split('|')[i] ?? ""),
                            ),
                        ],
                      ),
                      if (season == 0)
                        Column(
                          children: [
                            Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "${springTestList[stage].split('|')[0]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            for (var i = 1;
                                i < springTestList[stage].split("|").length;
                                i++)
                              ElevatedButton(
                                onPressed: () async {
                                  switch (stage) {
                                    case 0:
                                    case 1:
                                    case 2:
                                    case 3:
                                    case 5:
                                      if (i == 1) {
                                        detailSeasonValues[0]++;
                                      } else if (i == 2) {
                                        detailSeasonValues[1]++;
                                      } else {
                                        detailSeasonValues[2]++;
                                      }
                                      break;
                                    case 4:
                                      if (i == 1 || i == 2) {
                                        detailSeasonValues[0]++;
                                        detailSeasonValues[1]++;
                                      } else {
                                        detailSeasonValues[2]++;
                                      }
                                      break;
                                  }

                                  if (stage > springTestList.length - 2) {
                                    await detailSeasonTypeResult(
                                        detailSeasonValues);
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ${detailSeasonValues}');
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ');
                                },
                                child: Text(
                                    springTestList[stage].split('|')[i] ?? ""),
                              ),
                          ],
                        ),
                      if (season == 1)
                        Column(
                          children: [
                            Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "${summerTestList[stage].split('|')[0]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            for (var i = 1;
                                i < summerTestList[stage].split("|").length;
                                i++)
                              ElevatedButton(
                                onPressed: () async {
                                  switch (stage) {
                                    case 0:
                                    case 1:
                                    case 2:
                                    case 3:
                                    case 4:
                                      if (i == 1) {
                                        detailSeasonValues[0]++;
                                      } else if (i == 2) {
                                        detailSeasonValues[1]++;
                                      } else {
                                        detailSeasonValues[2]++;
                                      }
                                      break;
                                  }

                                  if (stage > summerTestList.length - 2) {
                                    await detailSeasonTypeResult(
                                        detailSeasonValues);
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ${detailSeasonValues}');
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ');
                                },
                                child: Text(
                                    summerTestList[stage].split('|')[i] ?? ""),
                              ),
                          ],
                        ),
                      if (season == 2)
                        Column(
                          children: [
                            Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "${fallTestList[stage].split('|')[0]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            for (var i = 1;
                                i < fallTestList[stage].split("|").length;
                                i++)
                              ElevatedButton(
                                onPressed: () async {
                                  switch (stage) {
                                    case 0:
                                    case 1:
                                    case 2:
                                    case 3:
                                      if (i == 1) {
                                        detailSeasonValues[0]++;
                                      } else if (i == 2) {
                                        detailSeasonValues[1]++;
                                      } else {
                                        detailSeasonValues[2]++;
                                      }
                                      break;
                                  }

                                  if (stage > fallTestList.length - 2) {
                                    await detailSeasonTypeResult(
                                        detailSeasonValues);
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ${detailSeasonValues}');
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ');
                                },
                                child: Text(
                                    fallTestList[stage].split('|')[i] ?? ""),
                              ),
                          ],
                        ),
                      if (season == 3)
                        Column(
                          children: [
                            Container(
                              height: 40,
                              child: Center(
                                child: Text(
                                  "${winterTestList[stage].split('|')[0]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            for (var i = 1;
                                i < winterTestList[stage].split("|").length;
                                i++)
                              ElevatedButton(
                                onPressed: () async {
                                  switch (stage) {
                                    case 0:
                                    case 1:
                                    case 2:
                                    case 3:
                                      if (i == 1) {
                                        detailSeasonValues[0]++;
                                      } else if (i == 2) {
                                        detailSeasonValues[1]++;
                                      } else {
                                        detailSeasonValues[2]++;
                                      }
                                      break;
                                  }

                                  if (stage > winterTestList.length - 2) {
                                    await detailSeasonTypeResult(
                                        detailSeasonValues);
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ${detailSeasonValues}');
                                  print(
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@=================>  ');
                                },
                                child: Text(
                                    winterTestList[stage].split('|')[i] ?? ""),
                              ),
                          ],
                        ),
                    ],
                  ),

                  FooterPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  seasonColorResult(List<int> seasonValues) async {
    // season
    List maxList = List.from(seasonValues); // list copy
    maxList.sort((a, b) => b.compareTo(a)); // list 내림차순

    int max = maxList[0];
    season = seasonValues.indexOf(max);
    ; // 가장 큰 값의 index

    print('@@@@@@@@@@@@@@!!!!!!!!!!!!========>       max: $seasonValues');
    print('@@@@@@@@@@@@@@!!!!!!!!!!!!========>       index: $season');
    print('@@@@@@@@@@@@@@!!!!!!!!!!!!========>       ');

    return season;

    // detailSeasonTypeValues

    // if (stageValues[0] == true &&
    //     stageValues[1] == true &&
    //     stageValues[2] == true &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[5] == false &&
    //     stageValues[8] == false &&
    //     stageValues[10] == true &&
    //     stageValues[11] == true &&
    //     stageValues[12] == false &&
    //     stageValues[13] == true &&
    //     stageValues[14] == true &&
    //     stageValues[15] == true &&
    //     stageValues[17] == true) {
    //   // 봄 브라이트
    //   season = 0;
    //   detailSeasonType = 0;
    // } else if (stageValues[0] == true &&
    //     stageValues[1] == true &&
    //     stageValues[2] == true &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[5] == true &&
    //     stageValues[6] == true &&
    //     stageValues[7] == false &&
    //     stageValues[8] == true &&
    //     stageValues[9] == false &&
    //     stageValues[10] == false &&
    //     stageValues[15] == true &&
    //     stageValues[17] == false) {
    //   // 봄 라이트
    //   season = 0;
    //   detailSeasonType = 1;
    // } else if (stageValues[0] == true &&
    //     stageValues[1] == true &&
    //     stageValues[2] == true &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[5] == false &&
    //     stageValues[6] == true &&
    //     stageValues[7] == false &&
    //     stageValues[8] == true &&
    //     stageValues[10] == false &&
    //     stageValues[13] == false &&
    //     stageValues[15] == true &&
    //     stageValues[17] == false) {
    //   // 봄 소프트
    //   season = 0;
    //   detailSeasonType = 5;
    // } else if (stageValues[0] == false &&
    //     stageValues[1] == true &&
    //     stageValues[2] == false &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[5] == true &&
    //     stageValues[6] == true &&
    //     stageValues[8] == false &&
    //     stageValues[9] == false &&
    //     stageValues[10] == true &&
    //     stageValues[11] == false &&
    //     stageValues[13] == false &&
    //     stageValues[14] == false &&
    //     stageValues[15] == false &&
    //     stageValues[16] == true &&
    //     stageValues[17] == true) {
    //   // 여름 브라이트
    //   season = 1;
    //   detailSeasonType = 0;
    // } else if (stageValues[0] == false &&
    //     stageValues[1] == true &&
    //     stageValues[2] == false &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[6] == true &&
    //     stageValues[7] == false &&
    //     stageValues[8] == true &&
    //     stageValues[9] == false &&
    //     stageValues[10] == false &&
    //     stageValues[11] == false &&
    //     stageValues[12] == true &&
    //     stageValues[13] == false &&
    //     stageValues[14] == false &&
    //     stageValues[16] == true &&
    //     stageValues[17] == false) {
    //   // 여름 라이트
    //   season = 1;
    //   detailSeasonType = 1;
    // } else if (stageValues[0] == false &&
    //     stageValues[1] == true &&
    //     stageValues[2] == false &&
    //     stageValues[3] == true &&
    //     stageValues[4] == true &&
    //     stageValues[6] == true &&
    //     stageValues[7] == false &&
    //     stageValues[9] == false &&
    //     stageValues[10] == false &&
    //     stageValues[11] == false &&
    //     stageValues[12] == true &&
    //     stageValues[13] == false &&
    //     stageValues[14] == false &&
    //     stageValues[15] == false &&
    //     stageValues[16] == true &&
    //     stageValues[17] == false) {
    //   // 여름 뮤트
    //   season = 1;
    //   detailSeasonType = 4;
    // } else if (stageValues[0] == true &&
    //     stageValues[1] == false &&
    //     stageValues[2] == true &&
    //     stageValues[3] == false &&
    //     stageValues[4] == false &&
    //     stageValues[5] == false &&
    //     stageValues[6] == false &&
    //     stageValues[7] == true &&
    //     stageValues[8] == false &&
    //     stageValues[9] == true &&
    //     stageValues[10] == false &&
    //     stageValues[11] == true &&
    //     stageValues[12] == false &&
    //     stageValues[13] == true &&
    //     stageValues[14] == false &&
    //     stageValues[16] == false &&
    //     stageValues[17] == false) {
    //   // 가을 딥
    //   season = 2;
    //   detailSeasonType = 2;
    // } else if (stageValues[0] == true &&
    //     stageValues[1] == false &&
    //     stageValues[2] == true &&
    //     stageValues[3] == false &&
    //     stageValues[4] == false &&
    //     stageValues[8] == false &&
    //     stageValues[9] == true &&
    //     stageValues[10] == true &&
    //     stageValues[11] == true &&
    //     stageValues[12] == false &&
    //     stageValues[13] == false &&
    //     stageValues[16] == false) {
    //   // 가을 스트롱
    //   season = 2;
    //   detailSeasonType = 3;
    // } else if (stageValues[0] == true &&
    //     stageValues[1] == false &&
    //     stageValues[2] == true &&
    //     stageValues[3] == false &&
    //     stageValues[4] == false &&
    //     stageValues[5] == false &&
    //     stageValues[7] == false &&
    //     stageValues[8] == false &&
    //     stageValues[9] == true &&
    //     stageValues[10] == false &&
    //     stageValues[12] == false &&
    //     stageValues[13] == false &&
    //     stageValues[14] == false &&
    //     stageValues[15] == true &&
    //     stageValues[16] == false &&
    //     stageValues[17] == false) {
    //   // 가을 뮤트
    //   season = 2;
    //   detailSeasonType = 4;
    // } else if (stageValues[1] == false &&
    //     stageValues[2] == false &&
    //     stageValues[4] == false &&
    //     stageValues[5] == true &&
    //     stageValues[6] == true &&
    //     stageValues[7] == true &&
    //     stageValues[8] == false &&
    //     stageValues[9] == false &&
    //     stageValues[10] == true &&
    //     stageValues[11] == false &&
    //     stageValues[12] == false &&
    //     stageValues[13] == false &&
    //     stageValues[14] == false &&
    //     stageValues[15] == false &&
    //     stageValues[16] == true &&
    //     stageValues[17] == true) {
    //   //겨울 브라이트
    //   season = 3;
    //   detailSeasonType = 0;
    // } else if (stageValues[1] == false &&
    //     stageValues[2] == false &&
    //     stageValues[4] == false &&
    //     stageValues[5] == true &&
    //     stageValues[7] == true &&
    //     stageValues[8] == false &&
    //     stageValues[9] == false &&
    //     stageValues[11] == false &&
    //     stageValues[12] == false &&
    //     stageValues[13] == true &&
    //     stageValues[14] == false &&
    //     stageValues[15] == false &&
    //     stageValues[17] == true) {
    //   // 겨울 딥
    //   season = 3;
    //   detailSeasonType = 2;
    // } else if (stageValues[1] == false &&
    //     stageValues[2] == false &&
    //     stageValues[4] == false &&
    //     stageValues[6] == true &&
    //     stageValues[9] == false &&
    //     stageValues[10] == false &&
    //     stageValues[11] == false &&
    //     stageValues[12] == true &&
    //     stageValues[14] == false &&
    //     stageValues[15] == false &&
    //     stageValues[16] == true &&
    //     stageValues[17] == false) {
    //   // 겨울 페일
    //   season = 3;
    //   detailSeasonType = 6;
    // }
  }

  detailSeasonTypeResult(List<int> detailSeasonValues) async {
    //detailSeasonType
    List maxList = List.from(detailSeasonValues);
    maxList.sort((a, b) => b.compareTo(a));

    int max = maxList[0];
    int detailSeasonType = detailSeasonValues.indexOf(max);

    if (season == -1) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ConsultantListScreen()),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) => SingleTextAlertDialog(
          message:
              "${getTranslated('HELP_FOR_AN_ACCURATE_DIAGNOSIS', context)}",
        ),
      );
    } else {
      bool loggedIn =
          await Provider.of<AuthProvider>(context, listen: false).isLoggedIn();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AIResultPage(
            season: season,
            detailSeasonType: detailSeasonType,
            consultingModel: widget.consultingModel,
            loggedIn: loggedIn,
          ),
        ),
      );
    }
  }
}
