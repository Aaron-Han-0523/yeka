import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/provider/consulting_provider.dart';

import 'package:yeka/util/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/personal_color_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/personal_color_provider.dart';
import '../../../provider/user_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import 'mypage_ai_result_screen.dart';
import 'mypage_client_list_screen.dart';
import 'mypage_consultant_result_screen.dart';
import 'mypage_consultant_update.dart';
import 'mypage_favorite_list_screen.dart';
import 'mypage_my_reserve_screen.dart';
import 'mypage_notice_board_list_screen.dart';
import 'mypage_order_list_screen.dart';
import 'mypage_payment.dart';
import 'mypage_update_screen.dart';

class MyPageHomeScreen extends StatefulWidget {
  @override
  State<MyPageHomeScreen> createState() => _MyPageHomeScreenState();
}

class _MyPageHomeScreenState extends State<MyPageHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  Map map;
  PersonalColorModel personalColorModel;
  ConsultingModel consultingModel;
  UserModel userModel;

  Column myPageList = Column(
    children: [],
  );

  Future<void> _loadData(BuildContext context, bool reload) async {
    consultingModel = ConsultingModel(
      client_id: map["id"],
    );

    consultingModel = await Provider.of<ConsultingProvider>(context, listen: false).getConsultingByClientId(consultingModel);

    await Provider.of<ConsultingProvider>(context, listen: false).getLatestConsultingList(0, map["id"], context, reload: true);

    personalColorModel = PersonalColorModel(
      season: consultingModel.season,
      detail_season_type: consultingModel.detail_season_type,
    );

    personalColorModel = await Provider.of<PersonalColorProvider>(context, listen: false).getPersonalColorCondition(personalColorModel);

    userModel = UserModel(
      id: consultingModel.consultant_id,
    );

    userModel = await Provider.of<UserProvider>(context, listen: false).getUser(userModel);

    ImageModel imageModel = ImageModel(user_id: map["id"]);

    await Provider.of<CustomImageProvider>(context, listen: false).getImage(imageModel);
  }

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
          MyPageAIResultPage(),
            isCheck: map["season"] == -1 ? true : false,
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MY_CONSULTING_RESERVATION/PAYMENT', context)}",
          MyPageMyReserveScreen(),
          isCheck: consultingModel == null ? true : false,
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('MY_CONSULTING_RESULT', context)}",
          MyPageConsultantResultScreen(),
          isCheck: consultingModel == null ? true : false,
        ));
        myPageList.children.add(buildItem(
          "${getTranslated('ORDER_LIST', context)}",
          MyPageOrderListScreen(),
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
        Text("${getTranslated('PLEASE_LOGIN', context)}"),
      ));
    }

    _loadData(context, false);
  }

  buildItem(String title, Widget targetWidget, {bool isCheck = false}) {
    return InkWell(
      onTap: () {
        if(isCheck) {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                SingleTextAlertDialog(
                  message: "${getTranslated('PLEASE_DO_THE_AI_TEST_FIRST', context)}",
                ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => targetWidget,
            ),
          );
        }
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
                    " ${getTranslated('>', context)}",
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
              "${getTranslated('MY_PAGE', context)}",isMyPageHidden: true,
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
                              "${map["username"]} ${map["user_type"] == 0 ? "${getTranslated('USER', context)}" : "${getTranslated('CONSULTANT', context)}"} ${getTranslated('HELLO_SIR', context)}",
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
