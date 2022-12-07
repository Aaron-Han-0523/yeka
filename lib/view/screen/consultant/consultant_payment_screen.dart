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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 31.5, 0, 21),
                      child: Text(
                        "${getTranslated('MY_CONSULTATION', context)}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14.5),
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
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14.5),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('PAYMENT_INFO', context)}",
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(255, 0, 0, 7.5),
                          child: Text(
                            "${getTranslated('RESERVATION_AMOUNT', context)}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 9,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 7.5),
                          child: Text(
                            "-2,500원",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 9,
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
                      padding: const EdgeInsets.fromLTRB(20, 5.5, 20, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('FINAL_PAYMENT_AMOUNT', context)}",
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
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 28),
                      child: Text(
                        "${getTranslated('FINAL_PAYMENT_DEDUCTED_AMOUNT', context)}",
                        style: TextStyle(
                          color: Color(0xff0123b4),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Text(
                    //     "반드시 상담이 모두 종료된 후에 \"상담완료 \" 버튼을 눌러주세요.",
                    //     style: TextStyle(
                    //       color: Color(0xffbbbbbb),
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 7.75),
                      child: Text(
                        "${getTranslated('PAYMENT_INFO', context)}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18,
                        ),
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
                      padding: const EdgeInsets.fromLTRB(20, 15.225, 20, 11),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
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
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
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
                        buttonText: "${getTranslated('CONFIRMATION', context)}"),
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
