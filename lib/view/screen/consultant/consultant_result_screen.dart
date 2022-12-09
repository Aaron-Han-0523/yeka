import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';

class ConsultantResultScreen extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantResultScreen({
    Key key,
    this.isCreateScreen = true,
  }) : super(key: key);

  @override
  State<ConsultantResultScreen> createState() => _ConsultantResultScreenState();
}

class _ConsultantResultScreenState extends State<ConsultantResultScreen>
    with TickerProviderStateMixin {
  double _currentSliderValue = 20;

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
            ).getAppbar(),

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
                      color: Color(0xffDDDDDD),
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
                                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 9.75),
                                    child: Text(
                                      "임지은",
                                      style: TextStyle(
                                        color: Color(0xff121212),
                                        fontSize: 22,
                                        letterSpacing: 8.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
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
                                    padding: const EdgeInsets.fromLTRB(0, 0, 14.5, 0),
                                    child: Text(
                                      "${getTranslated('COUNSELING_NAME', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                                    child: Text(
                                      "톡으로 만나는 나만의 피부 진단 :)",
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
                            "000",
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 17.5,
                            ), // Text(key['title']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "${getTranslated('COLOR', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
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
                                  padding: const EdgeInsets.fromLTRB(7.5, 16.5, 12.5, 13),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                      fit: BoxFit.fill,
                                      height: 15,
                                    ), // Text(key['title']),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    "봄 라이트",
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
                                    "맑고 따뜻한 색이 잘 어울리는 봄 라이트",
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
                                  padding: const EdgeInsets.fromLTRB(9, 0, 0, 3),
                                  child: Text(
                                    "#가벼운 #여성스러운 #싱그러운 #따뜻한 #아기자기한 #밝은 #로멘틱한",
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
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
                                      ),
                                    ),
                                    Container(
                                      // height: 32,
                                      // color: Colors.green,
                                      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                                      child: ClipRRect(
                                        // borderRadius:
                                        //     BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 42.5,
                                        ), // Text(key['title']),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 5, 13.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 17.5,
                            ), // Text(key['title']),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text(
                            "${getTranslated('FASHION', context)}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text(
                        "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이\n중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다.\n대비감이 어울리지 않기에 비슷한 느낌의 색상으로 자연스럽게\n매치하는 것이 좋습니다.",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "옷의 패턴과 악세사리는 꽃, 하트, 땡땡이 리본과 곡선적인 라인이 좋고\n큰 사이즈보다는 중간 ~ 작은 사이즈가 좋고 아세사리는 로즈골드,\n샴페인골드 색상이 좋습니다.",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 13.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 17.5,
                            ), // Text(key['title']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "${getTranslated('HAIR', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "허니 브라운, 밀크 브라운, 내추럴브라운, 애쉬 브라운, 라이트 브라운과 같이 밝은 브라운이 잘 어울리고 너무 노란 골드 브라운, 채도가 높은 체리레드, 명도가 낮은 블랙은 피해주시는게 좋습니다.",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 13.5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 17.5,
                            ), // Text(key['title']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "${getTranslated('PERFUME', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
                      child: Text(
                        "달콤하고 상큼한 향 ~ #시트리스 #프루티 #블로썸 #살구 #복숭아",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 13.5),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 17.5,
                            ), // Text(key['title']),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "${getTranslated('MAKE_UP', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
                              ),
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
                              color: Colors.grey,
                              style: BorderStyle.solid),
                        ),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('BASE', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "뉴트럴 컬러의 얇고 촉촉하며 은은한 광",
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
                                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        "${getTranslated('EYE', context)}",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text(
                                        "피치코랄, 따뜻한 색감이 많이 느껴지지 않는 베이지",
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
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('BLUSHER', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "피치코랄",
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
                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Text(
                                      "${getTranslated('LIP', context)}",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text(
                                      "웜톤이라고 고체도의 오렌지나 다홍색은 피해주시고 코랄 같은 핑크 계열",
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${getTranslated('WARM', context)}"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                            child: Text("${getTranslated('COOL', context)}"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${getTranslated('CLEAR', context)}"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                            child: Text("${getTranslated('BLUE', context)}"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                            child: Text("${getTranslated('HIGH_CONTRAST_IMAGE', context)}"),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                            child: Text("${getTranslated('LOW_CONTRAST_IMAGE', context)}"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                            child: Text("${getTranslated('HIGH_BRIGHTNESS', context)}"),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                            child: Text("${getTranslated('LOW_BRIGHTNESS', context)}"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                            child: Text("${getTranslated('GLOSS', context)}"),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 100,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 17, 0),
                            child: Text("${getTranslated('MATT', context)}"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
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
                                    child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                      fit: BoxFit.fill,
                                      height: 20,
                                    ), // Text(key['title']),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                                "고객님께서는 기존 피부톤 자체가 타고 나셔서 봄라이트 색으로 코디를 해주시면 더욱 멋진 사람이 될 것 같아요~ 물론 지금도 예쁘시지만 ^^ 앞으로도 조금 더 건강하고 예쁜 미인으로 거듭나시길 바랄게요 :) 상담하시느라 고생많으셨어요 ㅠ",
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
                    CustomElevatedButton(onTap: () {}, buttonText: "${getTranslated('CHECK_PRODUCT_FOR_ME', context)}"),
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
