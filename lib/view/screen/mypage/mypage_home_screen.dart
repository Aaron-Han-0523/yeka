import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
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
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "마이페이지",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
                    child: Column(
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "000님 안녕하세요 !",
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
                          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "개인정보 수정",
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
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "퍼스널 AI 분석 결과",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "내 상담예약 / 결제",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "내 컨설팅 결과",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "주문내역",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "찜 목록",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "공지사항",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "컨설턴트 정보 수정",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "정산 금액",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "내 고객 정보",
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
                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                          color: Color(0xffDDDDDD),
                        ),


                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: FooterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
