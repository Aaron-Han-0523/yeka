import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/consulting_model.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/user_provider.dart';
import '../../../util/color_resources.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import '../consultant/consultant_list_screen.dart';
import '../home/home_screens.dart';
import 'ai_result_screen.dart';

class DetailTypeTestPage extends StatefulWidget {
  final int season;
  final int detailSeasonType;
  final ConsultingModel consultingModel;
  final bool loggedIn;

  const DetailTypeTestPage(
      {Key key,
      this.consultingModel,
      this.season,
      this.detailSeasonType,
      this.loggedIn})
      : super(key: key);

  @override
  State<DetailTypeTestPage> createState() => _DetailTypeTestState();
}

var springTestList = [];
var summerTestList = [];
var fallTestList = [];
var winterTestList = [];

List<bool> stageValues = [];

// 계절을 판단하는데 필요한 설문 데이터 리스트(1, 2, 3, 4) ===> 최다빈도가 그 시즌으로 결정
List<int> seasonValues = [0, 0, 0, 0];
List<int> detailSeasonValues = [0, 0, 0];

int stage = 0;

int detailSeasonType = -1;

class _DetailTypeTestState extends State<DetailTypeTestPage>
    with TickerProviderStateMixin {
  bool loggedIn = false;
  Map map = Map();

  @override
  Widget build(BuildContext context) {
    print('season : $widget.season');
    springTestList = [];
    summerTestList = [];
    fallTestList = [];
    winterTestList = [];

    map = Provider.of<AuthProvider>(context, listen: false).getUser();

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
    springTestList
        .add("${getTranslated('DETAIL_SEASON_TYPE_TEST_LAST_INFORMATION', context)}");

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
    summerTestList
        .add("${getTranslated('DETAIL_SEASON_TYPE_TEST_LAST_INFORMATION', context)}");

    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA1', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA2', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA3', context)}");
    fallTestList.add("${getTranslated('DETAIL_SEASON_FALL_QNA4', context)}");
    fallTestList
        .add("${getTranslated('DETAIL_SEASON_TYPE_TEST_LAST_INFORMATION', context)}");

    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA1', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA2', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA3', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_WINTER_QNA4', context)}");
    winterTestList
        .add("${getTranslated('DETAIL_SEASON_TYPE_TEST_LAST_INFORMATION', context)}");

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(slivers: [
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        // color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.season == 0)
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.85,
                            height: 130,
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
                              },
                              child: Text(
                                  springTestList[stage].split('|')[i] ?? ""),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent[200],
                                foregroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    if (widget.season == 1)
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.85,
                            height: 130,
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
                              },
                              child: Text(
                                  summerTestList[stage].split('|')[i] ?? ""),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent[200],
                                foregroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    if (widget.season == 2)
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.85,
                            height: 130,
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
                              },
                              child: Text(
                                  fallTestList[stage].split('|')[i] ?? ""),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber[400],
                                foregroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    if (widget.season == 3)
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.85,
                            height: 130,
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
                              },
                              child: Text(
                                  winterTestList[stage].split('|')[i] ?? ""),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan[300],
                                foregroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    )
                  ]),
            ),
          ]),
        ));
  }

  detailSeasonTypeResult(List<int> detailSeasonValues) async {
    //detailSeasonType
    List maxList = List.from(detailSeasonValues);
    maxList.sort((a, b) => b.compareTo(a));

    int max = maxList[0];
    int detailSeasonType = detailSeasonValues.indexOf(max);


    if (widget.season == -1) {
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

      UserModel userModel = UserModel(
        id: map["id"],
        season: widget.season,
        detail_season_type:
        detailSeasonType,
      );

      await Provider.of<UserProvider>(context,
          listen: false)
          .updateUser(userModel);

      ImageModel imageModel = ImageModel(
        user_id: map["id"],
        title: "user personal color data",
        content:
        "id : ${map["id"]}, name : ${map["name"]}, username : ${map["username"]}",
        path:
        widget.consultingModel.client_image,
        create_date: DateConverter.formatDate(
            DateTime.now()),
      );

      await Provider.of<CustomImageProvider>(
          context,
          listen: false)
          .addImage(imageModel);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AIResultPage(
            season: widget.season,
            detailSeasonType: detailSeasonType,
            consultingModel: widget.consultingModel,
            loggedIn: loggedIn,
          ),
        ),
      );
    }
  }
}
