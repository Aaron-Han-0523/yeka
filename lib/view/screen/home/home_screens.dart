import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:yeka/view/screen/disposal/agree_screen.dart';
import 'package:yeka/view/screen/home/widget/banners_view.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../localization/language_constrants.dart';
import '../../../provider/banner_provider.dart';
import '../../../provider/review_provider.dart';
import '../../basewidget/button/main_page_text_button.dart';
import '../consultant/consultant_list_screen.dart';
import '../myprocess/myprocess_login_screen.dart';
import '../review/review_list_screen.dart';
import '../review/review_login_screen.dart';
import 'widget/review_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<BannerProvider>(context, listen: false)
        .getBannerJson(reload, context);
    // Provider.of<ReviewProvider>(context, listen: false)
    //     .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).highlightColor,
                  leading: Center(
                    child: Image.asset(
                      Images.main_logo,
                      height: 25,
                    ),
                  ),
                  title: Center(child: Text("예카", style: TextStyle(color: Colors.black87,), textAlign: TextAlign.center,)),
                  actions: [Text("예카", style: TextStyle(color: Colors.black87,), textAlign: TextAlign.center,),],
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // BannersView(),
                      // SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                      // 폐차견적 버튼
                      MainPageTextButton(
                        onTap: () => {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => ImageUploadPage()))
                        },
                        buttonImage: Images.main_text_1,
                        detailButtonText:
                            "AI 테스트 시작",
                      ),

                      // 내 진행 현황 버튼
                      MainPageTextButton(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ConsultantListScreen()))
                        },
                        buttonImage: Images.main_text_2,
                        detailButtonText:
                            "컨설턴트 상담",
                      ),

                      // 폐차GO 이용 후기 버튼
                      // 4개씩 가져오기
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Container(
                          // width: 170,
                          child: Text(
                            "뷰티상품",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      ReviewWidget(
                        isHomePage: true,
                        scrollController: _scrollController,
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Container(
                          // width: 170,
                          child: Text(
                            "커뮤니티",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Container(
                          // width: 170,
                          child: Text(
                            "커뮤니티의 내용물이 들어갈 자리",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      FooterPage(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
