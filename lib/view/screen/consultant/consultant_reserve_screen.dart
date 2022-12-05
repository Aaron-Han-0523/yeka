import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/consultant/consultant_my_reserve_screen.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';

class ConsultantReserveScreen extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantReserveScreen({
    Key key,
    this.isCreateScreen = true,
  }) : super(key: key);

  @override
  State<ConsultantReserveScreen> createState() =>
      _ConsultantReserveScreenState();
}

class _ConsultantReserveScreenState extends State<ConsultantReserveScreen>
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
                    Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          children: [
                            Text(
                              "상담정보",
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
                                    fontSize: 10,
                                  ),
                                ),
                              ],
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
                                    fontSize: 10,
                                  ),
                                ),
                              ],
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
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "* 예약금액은 전체 금액의 10%입니다.",
                              style: TextStyle(
                                color: Color(0xff0123b4),
                                fontSize: 16,
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
                                    color: Color(0xff333333),
                                    fontSize: 10,
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
                                    color: Color(0xff333333),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "입금자명과 회원님의 이름이 일치해야 하니 주의해주세요 :)",
                                        style: TextStyle(
                                          color: Color(0xff121212),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "입금이 확인되면 다음단계로 넘어갑니다.",
                                        style: TextStyle(
                                          color: Color(0xff121212),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            CustomElevatedButton(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ConsultantMyReserveScreen(),
                                      ),
                                  );
                                },
                                buttonText: "확인"),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        )),
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
