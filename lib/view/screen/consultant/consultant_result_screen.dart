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
              "${getTranslated('REVIEW_WRITE', context)}",
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
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 80,
                          ), // Text(key['title']),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "임지은",
                                  style: TextStyle(
                                    color: Color(0xff121212),
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  "컨설턴트",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "000",
                          style: TextStyle(
                            color: Color(0xff0123b4),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "님의 상담결과 알려드릴게요.",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 20,
                          ), // Text(key['title']),
                        ),
                        Text(
                          "색상",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(150.0),
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                  fit: BoxFit.fill,
                                  height: 20,
                                ), // Text(key['title']),
                              ),
                              Text(
                                "봄 라이트",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "맑고 따뜻한 색이 잘 어울리는 봄 라이트",
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            "#가벼운 #여성스러운 #싱그러운 #따뜻한 #아기자기한 #밝은 #로멘틱한",
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 120,
                            width: 120,
                          ), // Text(key['title']),
                        ),
                        Expanded(
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
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
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
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
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
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                  Container(
                                    // height: 32,
                                    // color: Colors.green,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                        fit: BoxFit.fill,
                                        height: 40,
                                      ), // Text(key['title']),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 20,
                          ), // Text(key['title']),
                        ),
                        Text(
                          "패션",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 20,
                          ), // Text(key['title']),
                        ),
                        Text(
                          "헤어",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 20,
                          ), // Text(key['title']),
                        ),
                        Text(
                          "향수",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                            fit: BoxFit.fill,
                            height: 20,
                          ), // Text(key['title']),
                        ),
                        Text(
                          "메이크업",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울맂 ㅣ않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 12,
                      ),
                    ),
                    Table(
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
                                Text(
                                  "베이스",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "뉴트럴 컬러의 얇고 촉촉하며 은은한 광",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "아이",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "피치코랄, 따뜻한 색감이 많이 느껴지지 않는 베이지",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "블러셔",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "피치코랄",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "립",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "웜톤이라고 고체도의 오렌지나 다홍색은 피해주시고 코랄 같은 핑크 계열",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("웜"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                          Text("쿨"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("청"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                          Text("탁"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("고대비"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                          Text("저대비"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("고명도"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                          Text("저명도"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("광택"),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                          Text("무광"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Color(0xfff8f8f8),
                          border: Border.all(
                            width: 3,
                            color: Color(0xffdddddd),
                          ),
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(5.0),
                          // ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(150.0),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                    fit: BoxFit.fill,
                                    height: 40,
                                  ), // Text(key['title']),
                                ),
                                Text(
                                  "컨설턴트 최종 평가",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "고객님께서는 기존 피부톤 자체가 타고 나셔서 봄라이트 색으로 코디를 해주시면 더욱 멋진 사람이 될 것 같아요~ 물론 지금도 예쁘시지만 ^^ 앞으로도 조금 더 건강하고 예쁜 미인으로 거듭나시길 바랄게요 :) 상담하시느라 고생많으셨어요 ㅠ",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    CustomElevatedButton(onTap: () {}, buttonText: "나에게 맞는 뷰티상품 보러가기"),
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
