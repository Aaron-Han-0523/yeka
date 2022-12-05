import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';
import 'consultant_result_screen.dart';

class ConsultantPaymentScreen extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantPaymentScreen({
    Key key,
    this.isCreateScreen = true,
  }) : super(key: key);

  @override
  State<ConsultantPaymentScreen> createState() =>
      _ConsultantPaymentScreenState();
}

class _ConsultantPaymentScreenState extends State<ConsultantPaymentScreen>
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
                    Text(
                      "나의 상담내역",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "상담일",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "2022.11.22(금)",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 11,
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
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "톡으로 만나는 나만의 피부 진단 :)",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "결제정보",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "25,000원",
                          style: TextStyle(
                            color: Color(0xff0123b4),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "예약금액",
                      style: TextStyle(
                        color: Color(0xff0123b4),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "-2,500원",
                      style: TextStyle(
                        color: Color(0xff0123b4),
                        fontSize: 9,
                      ),
                    ),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Text(
                          "최종결제금액",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "22,500원",
                          style: TextStyle(
                            color: Color(0xffff3d3d),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "* 최종결제금액은 사전에 결제하셨던 예약금액에서 차감된 금액입니다.",
                      style: TextStyle(
                        color: Color(0xff0123b4),
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      child: Text(
                        "반드시 상담이 모두 종료된 후에 \"상담완료 \" 버튼을 눌러주세요.",
                        style: TextStyle(
                          color: Color(0xffbbbbbb),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      "결제정보",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 18,
                      ),
                    ),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        Text(
                          "계좌번호",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "국민은행 0000-00-000000",
                          style: TextStyle(
                            color: Color(0xffff3d3d),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "예금주",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "임지은",
                          style: TextStyle(
                            color: Color(0xffff3d3d),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                      child: Text(
                        "입금자명과 회원님의 이름이 일치해야 하니 주의해주세요 :) \n 입금이 확인되면 다음단계로 넘어갑니다.",
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
                              builder: (_) => ConsultantResultScreen(),
                            ),
                          );
                        },
                        buttonText: "확인"),
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