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
import '../../basewidget/dialog/single_text_alertdialog.dart';
import '../consultant/consultant_list_screen.dart';
import '../home/home_screens.dart';
import 'detailTypeTest.dart';

class OXPage extends StatefulWidget {
  final ConsultingModel consultingModel;

  const OXPage({Key key, this.consultingModel}) : super(key: key);

  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  var seasonTestList = [];


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
          builder: (_) => DetailTypeTestPage(
            season: season,
            detailSeasonType: detailSeasonType,
            consultingModel: widget.consultingModel,
            loggedIn: loggedIn,
          ),
        ),
      );
    }

    //   // 봄 브라이트
    //   season = 0;
    //   detailSeasonType = 0;

    //   // 봄 라이트
    //   season = 0;
    //   detailSeasonType = 1;

    //   // 봄 소프트
    //   season = 0;
    //   detailSeasonType = 5;

    //   // 여름 브라이트
    //   season = 1;
    //   detailSeasonType = 0;

    //   // 여름 라이트
    //   season = 1;
    //   detailSeasonType = 1;

    //   // 여름 뮤트
    //   season = 1;
    //   detailSeasonType = 4;

    //   // 가을 딥
    //   season = 2;
    //   detailSeasonType = 2;

    //   // 가을 스트롱
    //   season = 2;
    //   detailSeasonType = 3;

    //   // 가을 뮤트
    //   season = 2;
    //   detailSeasonType = 4;

    //   //겨울 브라이트
    //   season = 3;
    //   detailSeasonType = 0;

    //   // 겨울 딥
    //   season = 3;
    //   detailSeasonType = 2;

    //   // 겨울 페일
    //   season = 3;
    //   detailSeasonType = 6;
    // }
  }

  // detailSeasonTypeResult(List<int> detailSeasonValues) async {
  //   //detailSeasonType
  //   List maxList = List.from(detailSeasonValues);
  //   maxList.sort((a, b) => b.compareTo(a));
  //
  //   int max = maxList[0];
  //   int detailSeasonType = detailSeasonValues.indexOf(max);
  //
  //   if (season == -1) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
  //     Navigator.of(context).push(
  //       MaterialPageRoute(builder: (_) => ConsultantListScreen()),
  //     );
  //
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => SingleTextAlertDialog(
  //         message:
  //             "${getTranslated('HELP_FOR_AN_ACCURATE_DIAGNOSIS', context)}",
  //       ),
  //     );
  //   } else {
  //     bool loggedIn =
  //         await Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
  //
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (_) => AIResultPage(
  //           season: season,
  //           detailSeasonType: detailSeasonType,
  //           consultingModel: widget.consultingModel,
  //           loggedIn: loggedIn,
  //         ),
  //       ),
  //     );
  //   }
  // }
}
