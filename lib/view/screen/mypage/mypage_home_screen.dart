import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../aitest/ai_result_screen.dart';
import '../consultant/consultant_my_reserve_screen.dart';
import '../consultant/consultant_result_screen.dart';
import 'mypage_client_list_screen.dart';
import 'mypage_consultant_update.dart';
import 'mypage_favorite_list_screen.dart';
import 'mypage_notice_board_list_screen.dart';
import 'mypage_order_screen.dart';
import 'mypage_payment.dart';
import 'mypage_update_screen.dart';

class MyPageHomeScreen extends StatefulWidget {
  @override
  State<MyPageHomeScreen> createState() => _MyPageHomeScreenState();
}

class _MyPageHomeScreenState extends State<MyPageHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBar(
                "${getTranslated('MY_PAGE', context)}",

            ).getAppbar(),
            SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffDDDDDD),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(4, 14, 4, 19),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "000${getTranslated('HELLO_SIR', context)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                              Text(
                                "rudf8182@naver.com",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff999999),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageUpdateScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  AIResultPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('PERSONAL_AI_ANALYSIS_RESULT', context)}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConsultantMyReserveScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('MY_CONSULTING_RESERVATION/PAYMENT', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ConsultantResultScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('MY_CONSULTING_RESULT', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageOrderScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('ORDER_LIST', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageFavoriteListScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('LIKE_LIST', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageNoticeBoardListScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('NOTICE', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageConsultantUpdateScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('MODIFY_CONSULTANT_INFO', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPagePaymentScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('SETTLEMENT_AMOUNT', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyPageClientListScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${getTranslated('MY_CUSTOMER_INFO', context)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " >",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),


                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
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
