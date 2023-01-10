import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yeka/data/model/response/personal_color_model.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/product/product_list_screen.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/personal_color_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//color_resources.dart';
import '../../../util//dimensions.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/home_screens.dart';
import '../home/widget/footer_screens.dart';

class ConsultantResultScreen extends StatefulWidget {
  final bool isCreateScreen;
  final ConsultingModel consultingModel;
  final UserModel userModel;

  const ConsultantResultScreen({
    Key key,
    this.isCreateScreen = true,
    this.userModel,
    this.consultingModel,
  }) : super(key: key);

  @override
  State<ConsultantResultScreen> createState() => _ConsultantResultScreenState();
}

class _ConsultantResultScreenState extends State<ConsultantResultScreen>
    with TickerProviderStateMixin {
  SfRangeValues _currentSliderValue1 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue2 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue3 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue4 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue5 = SfRangeValues(30, 30);

  String name;
  PersonalColorModel personalColorModel;
  ImageModel imageModel;

  Widget buildSlider(
      String leftString, String rightString, SfRangeValues currentSliderValue) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        17.0,
        0.0,
        17.0,
        .0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${leftString}"),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: SfRangeSlider(
              values: currentSliderValue,
              max: 100,
              activeColor: Color(0xfff8f8f8),
              inactiveColor: Color(0xffdddddd),
              enableTooltip: true,
              // shouldAlwaysShowTooltip: true,
              onChanged: (SfRangeValues value) {
                setState(() {
                  currentSliderValue = value;
                });
              },
            ),
          ),
          Text("${rightString}"),
        ],
      ),
    );
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    Map map = await Provider.of<AuthProvider>(context, listen: false).getUser();
    name = map["name"];

    var season = map["season"];
    var detail_season_type = map["detail_season_type"];

    personalColorModel = PersonalColorModel(
      season: season,
      detail_season_type: detail_season_type,
    );

    personalColorModel =
        await Provider.of<PersonalColorProvider>(context, listen: false)
            .getPersonalColorCondition(personalColorModel);

    personalColorModel =
        await Provider.of<PersonalColorProvider>(context, listen: false)
            .personalColor;

    imageModel = Provider.of<CustomImageProvider>(context, listen: false).image;
  }

  @override
  void didChangeDependencies() async {
    await super.didChangeDependencies();
    await _loadData(context, false);
    setState(() {
      personalColorModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(milliseconds: 0), () {
    //   setState(() {
    //     personalColorModel;
    //   });
    // });

    var seasonKor = "";
    var detailSeasonType = "";

    var matchingColorList = [
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
    ];

    if (personalColorModel != null) {
      personalColorModel.season != null ? personalColorModel.season : -1;
      personalColorModel.detail_season_type != null
          ? personalColorModel.detail_season_type
          : -1;

      if (personalColorModel.season == 0) {
        seasonKor = "봄";
      } else if (personalColorModel.season == 1) {
        seasonKor = "여름";
      } else if (personalColorModel.season == 2) {
        seasonKor = "가을";
      } else if (personalColorModel.season == 3) {
        seasonKor = "겨울";
      }

      if (personalColorModel.detail_season_type == 0) {
        detailSeasonType = "브라이트";
      } else if (personalColorModel.detail_season_type == 1) {
        detailSeasonType = "라이트";
      } else if (personalColorModel.detail_season_type == 2) {
        detailSeasonType = "딥";
      } else if (personalColorModel.detail_season_type == 3) {
        detailSeasonType = "스트롱";
      } else if (personalColorModel.detail_season_type == 4) {
        detailSeasonType = "뮤트";
      } else if (personalColorModel.detail_season_type == 5) {
        detailSeasonType = "소프트";
      } else if (personalColorModel.detail_season_type == 6) {
        detailSeasonType = "페일";
      }

      if (personalColorModel.matching_color_array != null &&
          personalColorModel.matching_color_array.split(",").length > 11) {
        matchingColorList = personalColorModel.matching_color_array.split(",");
      }
    }

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            CustomSliverAppBar(
              "${getTranslated('RESULT_CONSULTING', context)}",
            ),

            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.bottomCenter,
                // width: MediaQuery.of(context).size.width + 100,
                decoration: BoxDecoration(color: Colors.white),
                // constraints: BoxConstraints(
                //     minHeight: MediaQuery.of(context).size.height * 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 2,
                      color: Color(0xff666666),
                      indent: 0,
                      endIndent: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 14.5, 12.5, 27),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0.0,
                              0.0,
                              8.0,
                              0.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.placeholder1,
                                image: widget.userModel.title_image != null
                                    ? AppConstants.BASE_URL +
                                        "/" +
                                        widget.userModel.title_image
                                    : AppConstants.BASE_URL +
                                        "/placeholder_1x1.png",
                                fit: BoxFit.fill,
                                height: 107,
                                width: 107,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 5, 9.75),
                                    child: Text(
                                      "${widget.userModel.name}",
                                      style: TextStyle(
                                        color: Color(0xff121212),
                                        fontSize: 22,
                                        letterSpacing: 8.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                    child: Text(
                                      "${getTranslated('CERTIFICATE_CONSULTANT', context)}",
                                      style: TextStyle(
                                        color: Color(0xffBBBBBB),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 200,
                                child: const Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xffDDDDDD),
                                ),
                              ),
                              SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 14.5, 0),
                                    child: Text(
                                      "${getTranslated('COUNSELING_NAME', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 1, 0, 0),
                                    child: Text(
                                      "${widget.consultingModel.consulting_title}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        children: [
                          Text(
                            "${name}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${getTranslated('SHOW_YOUR_RESULT', context)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 17),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Color(0xffFECB03),
                            ),
                            child: Center(
                              child: Text(
                                "${getTranslated('ONE', context)}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffEEEEEE),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "${getTranslated('COLOR', context)}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        width: 335,
                        height: 94,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xffdddddd),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        7.5, 16.5, 12.5, 13),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.asset(
                                        Images.chk,
                                        fit: BoxFit.fill,
                                        height: 15,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "${seasonKor} ${detailSeasonType}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text(
                                      "${personalColorModel != null ? personalColorModel.description : ""}",
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    "${personalColorModel != null ? personalColorModel.tag : ""}",
                                    style: TextStyle(
                                      color: Color(0xff999999),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 11, 10, 25),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.placeholder1,
                                image:
                                    widget.consultingModel.client_image != null
                                        ? AppConstants.BASE_URL +
                                            "/" +
                                            widget.consultingModel.client_image
                                        : AppConstants.BASE_URL +
                                            "/placeholder_1x1.png",
                                fit: BoxFit.fill,
                                height: 177,
                                width: 167.5,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return Container(
                                    // padding: const EdgeInsets.all(10.0),
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xfff1f1f1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        Images.placeholder_1x1,
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                            child: Table(
                              border: TableBorder.all(color: Colors.white),
                              columnWidths: {
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth(),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[0].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[1].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[2].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[3].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Image(
                                        image: AssetImage(Images.logo_b),
                                        fit: BoxFit.fitWidth,
                                        height: 42.5,
                                        width: 42.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[4].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[5].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[6].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              'FF${matchingColorList[7].replaceAll('#', '')}',
                                              radix: 16)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xffFECB03),
                              ),
                              child: Center(
                                child: Text(
                                  "${getTranslated('TWO', context)}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${getTranslated('FASHION', context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        "${personalColorModel != null ? personalColorModel.fashion : ""}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xffFECB03),
                              ),
                              child: Center(
                                child: Text(
                                  "${getTranslated('THREE', context)}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${getTranslated('HAIR', context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "${personalColorModel != null ? personalColorModel.hair : ""}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xffFECB03),
                              ),
                              child: Center(
                                child: Text(
                                  "${getTranslated('FOUR', context)}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${getTranslated('PERFUME', context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "${personalColorModel != null ? personalColorModel.perfume : ""}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xffFECB03),
                              ),
                              child: Center(
                                child: Text(
                                  "${getTranslated('FIVE', context)}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${getTranslated('MAKE_UP', context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                    //   style: TextStyle(
                    //     color: Color(0xff000000),
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 31.25),
                      child: Table(
                        border: TableBorder.symmetric(
                          outside: BorderSide.none,
                          inside: const BorderSide(
                              width: 1,
                              color: Color(0xffDDDDDD),
                              style: BorderStyle.solid),
                        ),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('BASE', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "${personalColorModel != null ? personalColorModel.makeup_base : ""}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        "${getTranslated('EYE', context)}",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text(
                                        "${personalColorModel != null ? personalColorModel.makeup_eye : ""}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('BLUSHER', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "${personalColorModel != null ? personalColorModel.makeup_blusher : ""}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('LIP', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "${personalColorModel != null ? personalColorModel.lip : ""}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    buildSlider(getTranslated('WARM', context),
                        getTranslated('COOL', context), _currentSliderValue1),
                    buildSlider(getTranslated('CLEAR', context),
                        getTranslated('CLOUDY', context), _currentSliderValue2),
                    buildSlider(
                        getTranslated('HIGH_CONTRAST_IMAGE', context),
                        getTranslated('LOW_CONTRAST_IMAGE', context),
                        _currentSliderValue3),
                    buildSlider(
                        getTranslated('HIGH_BRIGHTNESS', context),
                        getTranslated('LOW_BRIGHTNESS', context),
                        _currentSliderValue4),
                    buildSlider(getTranslated('GLOSS', context),
                        getTranslated('MATT', context), _currentSliderValue5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          // color: Color(0xfff8f8f8),
                          border: Border.all(
                            width: 3,
                            color: Color(0xffEEEEEE),
                          ),
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(5.0),
                          // ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    // borderRadius: BorderRadius.circular(150.0),
                                    child: Image.asset(
                                      Images.chat,
                                      fit: BoxFit.fill,
                                      height: 25,
                                    ), // Text(key['title']),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    "${getTranslated('CONSULT_FINAL_EVALUATION', context)}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                // fixme Model에 변수 없음
                                "${widget.consultingModel.consulting_content ?? ""}",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    CustomElevatedButton(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => HomePage(),
                            ),
                            (route) => false);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductListScreen(),
                          ),
                        );
                      },
                      buttonText:
                          "${getTranslated('CHECK_PRODUCT_FOR_ME', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    FooterPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
