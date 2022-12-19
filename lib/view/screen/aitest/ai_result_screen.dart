import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/personal_color_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/personal_color_provider.dart';
import '../../../utill/images.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../home/home_screens.dart';

class AIResultPage extends StatefulWidget {
  final int season;
  final int detailSeasonType;

  const AIResultPage({Key key, this.season, this.detailSeasonType})
      : super(key: key);

  @override
  State<AIResultPage> createState() => _AIResultPageState();
}

class _AIResultPageState extends State<AIResultPage>
    with TickerProviderStateMixin {
  Future<void> _loadData(BuildContext context, bool reload) async {
    PersonalColorModel personalColorModel = PersonalColorModel(
      season: widget.season,
      detail_season_type: widget.detailSeasonType,
    );

    Provider.of<PersonalColorProvider>(context, listen: false)
        .getPersonalColor(personalColorModel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
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
              CustomSliverAppBar("${getTranslated('RESULT_AT_TEST', context)}"),

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
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OOO",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff0123B4),
                            ),
                          ),
                          Text(
                            "${getTranslated('AI_TEST_RESULT', context)}",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "당신은 Spring ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "봄 라이트", //형광
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            " 입니다.",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Center(
                        child: Text(
                          "맑고 따뜻한 색이 잘 어울리는 봄 라이트",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xffCCCCCC),
                          ),
                        ),
                      ),

                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Center(
                        child: Text(
                          "#가벼운 #여성스러운 #싱그러운 #따뜻한 #아기자기한 #로멘틱한",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff0123B4),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.598,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 10),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * 0.53,
                              width: MediaQuery.of(context).size.width * 0.53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(230),
                                ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 18),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 26, 10),
                                    child: Container(
                                      height: 42.5,
                                      width: 42.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          // width: MediaQuery.of(context).size.width * 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 9, 0),
                            child: Image.asset(
                              Images.painting,
                              height: MediaQuery.of(context).size.width * 0.058,
                            ),
                          ),
                          Text(
                            "봄 라이트 사람들이 베이직하게 쓸 수 있는 컬러",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(50),
                                  // ),
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(50),
                                  // ),
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(50),
                                  // ),
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(50),
                                  // ),
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          // height: 50,
                          // width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.solid,
                            ),
                            // color: Colors.lightGreenAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          7, 0, 15, 0),
                                      child: Image.asset(
                                        Images.chk,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                    Text(
                                      "봄 라이트",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                  child: Text(
                                    "맑고 따뜻한 색이 잘 어울리는 봄 라이트",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                  child: Text(
                                    "#가벼운 #여성스러운 #싱그러운 # 따뜻한 #아기자기한 #밝은 #로맨틱한",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
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
                                  "${getTranslated('ONE', context)}",
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

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                        child: Text(
                          "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울리지 않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다. 옷의 패턴과 악세사리는 꽃, 하트, 땡땡이 리본과 곡선적인 라인이 좋고 큰 사이즈보다는 중간 ~ 작은 사이즈가 좋고 악세사리는 로즈골드, 샴페인골드 색상이 좋습니다.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
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
                            "${getTranslated('HAIR', context)}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                        child: Text(
                          "허니 브라운, 밀크 브라운, 내추럴 브라운, 애쉬 브라운, 라이트 브라운 과 같이 밝은 브라운이 잘 어울리고 너무 노란 골드 브라운, 채도가 높은 체리레드, 명도가 낮은 블랙은 피해주시는게 좋습니다.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "${getTranslated('IS_NOT_PRECISE', context)}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff0123B4),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.0,
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
                              child: CustomElevatedButton(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) => HomePage()),
                                      (route) => false);
                                },
                                buttonText:
                                    "${getTranslated('DO_OVER', context)}",
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Container(
                                height: 40,
                                child: CustomOutlinedButton(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  buttonText:
                                      "${getTranslated('CONSULT_WITH_CONSULTANT', context)}",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

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
