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
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 24, 0, 10),
                                  child: Text(
                                    "${getTranslated('CONSULTATION_INFO', context)}",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 3,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xffDDDDDD),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('COUNSELING', context)}",
                                    style: TextStyle(
                                      color: Color(0xffbbbbbb),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "2022.11.22(금)",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('COUNSELING_NAME', context)}",
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
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('RESERVATION_AMOUNT', context)}",
                                    style: TextStyle(
                                      color: Color(0xffbbbbbb),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "2,500원",
                                    style: TextStyle(
                                      color: Color(0xff0123B4),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                              child: Row(
                                children: [
                                  Text(
                                    "${getTranslated('DISCOUNT_10%', context)}",
                                    style: TextStyle(
                                      color: Color(0xff0123b4),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                              child: Row(
                                children: [
                                  Text(
                                    "${getTranslated('PAYMENT_INFO', context)}",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 3,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xffDDDDDD),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('GRADATION_INFO', context)}",
                                    style: TextStyle(
                                      color: Color(0xffbbbbbb),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "국민은행 0000-00-000000",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 11, 20, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('DISCOUNT_HOLDER', context)}",
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
                            ),
                            Container(
                              decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                              padding: EdgeInsets.fromLTRB(65, 0, 65, 0),
                              child: Column(
                                children: [
                                  Text(
                                    "${getTranslated('DEPOSIT_WARNING', context)}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff979797),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "${getTranslated('DEPOSIT_WARNING_NEXT', context)}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff979797),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
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
