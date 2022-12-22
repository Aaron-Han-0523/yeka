import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../aitest/ai_result_screen.dart';
import '../consultant/consultant_my_reserve_screen.dart';
import 'mypage_client_list_screen.dart';
import 'mypage_consultant_result_screen.dart';
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

  Map map;
  Column myPageList = Column(
    children: [],
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    map = Provider.of<AuthProvider>(context, listen: false).getUser();

    if (map["user_type"] != null) {
      int user_type = map["user_type"]; // 0사용자, 1컨설턴트, 2협력사, 99관리자

      if (user_type == 0) {
        myPageList.children.add(buildItem(
          "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
          MyPageUpdateScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('PERSONAL_AI_ANALYSIS_RESULT', context)}",
          AIResultPage(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MY_CONSULTING_RESERVATION/PAYMENT', context)}",
          ConsultantMyReserveScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MY_CONSULTING_RESULT', context)}",
          MyPageConsultantResultScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('ORDER_LIST', context)}",
          MyPageOrderScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('LIKE_LIST', context)}",
          MyPageFavoriteListScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('NOTICE', context)}",
          MyPageNoticeBoardListScreen(),
        ));
      } else if (user_type == 1) {
        myPageList.children.add(buildItem(
          "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
          MyPageUpdateScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MODIFY_CONSULTANT_INFO', context)}",
          MyPageConsultantUpdateScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('SETTLEMENT_AMOUNT', context)}",
          MyPagePaymentScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MY_CUSTOMER_INFO', context)}",
          MyPageClientListScreen(),
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('NOTICE', context)}",
          MyPageNoticeBoardListScreen(),
        ));
      }
    } else {
      myPageList.children.add(buildItem(
        "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
        Text("로그인하세요."),
      ));
    }
  }

  buildItem(String title, Widget targetWidget) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => targetWidget,
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
                    "$title",
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
            indent: 20,
            endIndent: 20,
            color: Color(0xffDDDDDD),
          ),
        ],
      ),
    );
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
            ),
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
                              "${map["username"]} ${map["user_type"] == 0 ? "사용자" : "컨설턴트"} ${getTranslated('HELLO_SIR', context)}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            Text(
                              "${map["email"]}",
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
                    myPageList,
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
