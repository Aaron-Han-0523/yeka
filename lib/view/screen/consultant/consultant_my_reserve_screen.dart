import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';
import 'consultant_payment_screen.dart';

class ConsultantMyReserveScreen extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantMyReserveScreen({
    Key key,
    this.isCreateScreen = true,
  }) : super(key: key);

  @override
  State<ConsultantMyReserveScreen> createState() =>
      _ConsultantMyReserveScreenState();
}

class _ConsultantMyReserveScreenState extends State<ConsultantMyReserveScreen>
    with TickerProviderStateMixin {
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
                        Column(
                          children: [
                            Text(
                              "반갑습니다 고객님 :)",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "현재",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "상담진행 중",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  "입니다.",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "지금 바로 나의 컨설턴트를 만나보세요.",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  4.0, 4.0, 12.0, 4.0),
                              child: InkWell(
                                onTap: () => {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => AuthScreen()))
                                },
                                child: Image.asset(
                                  Images.mypage,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "내 컨설턴트 정보",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          child: Image.network(
                            // widget.reviewModel.attachedFilepath1,
                            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.width * 0.85,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "#피부관련전공 #전문과정수료 #블로그 운영",
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 12,
                      ),
                    ),
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
                            color: Color(0xffcccccc),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Table(
                      border: TableBorder.all(color: Colors.white),
                      columnWidths: {
                        0: FixedColumnWidth(130),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Container(
                              // height: 32,
                              // color: Colors.green,
                              child: Text(
                                "연락처",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              // height: 32,
                              // color: Colors.red,
                              child: Text(
                                "010-0000-0000",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              // height: 32,
                              // color: Colors.green,
                              child: Text(
                                "지역",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              // height: 32,
                              // color: Colors.red,
                              child: Text(
                                "서울특별시 강남구",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              child: Text(
                                "주소",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "서울특별시 강남구 테헤란로 51길 14(브라운 스 5층 501)",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              child: Text(
                                "예약일",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "2022. 11. 22(금)",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              child: Text(
                                "자격현황 및 이력",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "인천대학교 메이크업아티스트 학과 전공\n피부미용사자격증 1급\n피부미용사자격증 1급\n피부미용사자격증 1급\n피부미용사자격증 1급",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              child: Text(
                                "사업자등록번호",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "00000-00-00000",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                      child: Text(
                        "반드시 상담이 모두 종료된 후에 \"상담완료 \" 버튼을 눌러주세요.",
                        style: TextStyle(
                          color: Color(0xffbbbbbb),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    CustomElevatedButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ConsultantPaymentScreen(),
                            ),
                          );
                        },
                        buttonText: "상담완료"),
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
