import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yeka/data/model/response/consulting_model.dart';
import 'package:yeka/data/model/response/personal_color_model.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';

class MyPageConsultantResultScreen extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;
  final ConsultingModel consultingModel;
  final PersonalColorModel personalColorModel;

  const MyPageConsultantResultScreen({
    Key key,
    this.isCreateScreen = true, this.userModel, this.consultingModel, this.personalColorModel,
  }) : super(key: key);

  @override
  State<MyPageConsultantResultScreen> createState() => _MyPageConsultantResultScreenState();
}

class _MyPageConsultantResultScreenState extends State<MyPageConsultantResultScreen>
    with TickerProviderStateMixin {
  SfRangeValues _currentSliderValue1 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue2 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue3 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue4 = SfRangeValues(30, 30);
  SfRangeValues _currentSliderValue5 = SfRangeValues(30, 30);

  Widget buildSlider(String leftString, String rightString, SfRangeValues currentSliderValue) {
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

  @override
  Widget build(BuildContext context) {
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 75,
                            ), // Text(key['title']),
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
                                width: 250,
                                child: const Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xffDDDDDD),
                                ),
                              ),
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
                            "${widget.userModel.name}",
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "${getTranslated('SHOW_YOUR_RESULT', context)}",
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      7.5, 16.5, 12.5, 13),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
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
                                    "${widget.consultingModel.season} ${widget.consultingModel.detail_season_type}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(9, 0, 0, 3),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.personalColorModel.description}",
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 0, 0, 3),
                                  child: Text(
                                    "${widget.personalColorModel.tag}",
                                    style: TextStyle(
                                      color: Color(0xff999999),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 11, 10, 25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 177,
                              width: 167.5,
                            ), // Text(key['title']),
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
                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: Container(
                                        height: 42.5,
                                        width: 42.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFECB03),
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
                    //fixme 이부분도 합쳐야 한다면 확인 부탁드립니다.
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        "${widget.personalColorModel.fashion}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "${widget.personalColorModel.fashion}",
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
                        "${widget.personalColorModel.hair}",
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
                        "${widget.personalColorModel.perfume}",
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
                                      "${widget.personalColorModel.makeup_base}",
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
                                        "${widget.personalColorModel.makeup_eye}",
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
                                      "${widget.personalColorModel.makeup_blusher}",
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
                                      "${widget.personalColorModel.lip}",
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
                    buildSlider(getTranslated('WARM', context), getTranslated('COOL', context), _currentSliderValue1),
                    buildSlider(getTranslated('CLEAR', context), getTranslated('CLOUDY', context), _currentSliderValue2),
                    buildSlider(getTranslated('HIGH_CONTRAST_IMAGE', context), getTranslated('LOW_CONTRAST_IMAGE', context), _currentSliderValue3),
                    buildSlider(getTranslated('HIGH_BRIGHTNESS', context), getTranslated('LOW_BRIGHTNESS', context), _currentSliderValue4),
                    buildSlider(getTranslated('GLOSS', context), getTranslated('MATT', context), _currentSliderValue5),
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
                                "${widget.consultingModel.consulting_content}",
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
                        onTap: () {},
                        buttonText:
                            "${getTranslated('CHECK_PRODUCT_FOR_ME', context)}"),
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
