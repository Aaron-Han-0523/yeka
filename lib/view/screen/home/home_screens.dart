import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_view.dart';

import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/community_freeboard_provider.dart';
import '../../../provider/community_notice_provider.dart';
import '../../../provider/community_provider.dart';
import '../../../provider/community_youtube_provider.dart';
import '../../../provider/order_provider.dart';
import '../../../provider/product_provider.dart';
import '../../../provider/user_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/product_shimmer.dart';
import '../aitest/image_upload_screen.dart';
import '../community/community_free_board_detail_screen.dart';
import '../community/community_home_screen.dart';
import '../community/community_youtube_detail_screen.dart';
import '../consultant/consultant_list_screen.dart';
import '../mypage/mypage_notice_board_detail_screen.dart';
import '../product/product_list_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    int user_id =
        Provider.of<AuthProvider>(context, listen: false).getUser()["id"];

    await Provider.of<CommunityProvider>(context, listen: false)
        .getLatestCommunityList(0, context, reload: reload);

    await Provider.of<CommunityYoutubeProvider>(context, listen: false)
        .getCommunityList(0, context);

    await Provider.of<CommunityFreeBoardProvider>(context, listen: false)
        .getCommunityList(0, context);

    await Provider.of<CommunityNoticeProvider>(context, listen: false)
        .getCommunityList(0, context);

    await Provider.of<ProductProvider>(context, listen: false)
        .getLatestProductList(0, user_id, context, reload: reload);

    // Provider.of<UserProvider>(context, listen: false)
    //     .getLatestUserList(0, context, reload: reload);

    await Provider.of<UserProvider>(context, listen: false).getSuperUser();

    // await Provider.of<UserProvider>(context, listen: false)
    //     .getLatestConsultantList(0, context, reload: reload);

    await Provider.of<OrderProvider>(context, listen: false)
        .getLatestOrderList(0, user_id, context, reload: reload);

    print("==============");
    print(
        "${Provider.of<UserProvider>(context, listen: false).superuser.toJson()}");
    print("${Provider.of<AuthProvider>(context, listen: false).getUser()}");
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // fixme 개발 중이라 홈으로 올때는 무조건 초기화 하도록 조정하였음
    // fixme 운영할 때는 false 로 변경해야함
    // _loadData(context, false);
    await _loadData(context, true);
  }

  Widget buildCommunity() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        8.0,
        0.0,
        8.0,
        0.0,
      ),
      child: Consumer<CommunityProvider>(
        builder: (context, provider, child) {
          List<CommunityModel> list = provider.latestCommunityList;

          print('========hello hello===>${list.length}');

          return Column(children: [
            !provider.filterFirstLoading
                ? list.length != 0
                    ? StaggeredGridView.countBuilder(
                        itemCount: list.length > 4 ? 4 : list.length,
                        crossAxisCount: 1,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        // scrollDirection:
                        //     isHomePage ? Axis.horizontal : Axis.vertical,
                        shrinkWrap: true,
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(1),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              index == 0
                                  ? Container()
                                  : Divider(
                                      height: 2.0,
                                      color: Colors.grey,
                                    ),
                              InkWell(
                                onTap: () {
                                  // if (list[index].community_type == 0) {
                                  //   // 공지사항
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           MyPageNoticeBoardDetailScreen(
                                  //         communityModel: list[index],
                                  //       ),
                                  //     ),
                                  //   );
                                  // } else
                                  if (list[index].community_type == 1) {
                                    // 유튜브 및 칼럼
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityYoutubeDetailScreen(
                                          communityModel: list[index],
                                        ),
                                      ),
                                    );
                                  } else if (list[index].community_type == 2) {
                                    // 자유게시판
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityFreeBoardDetailScreen(
                                          communityModel: list[index],
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        12.0,
                                        12.0,
                                        12.0,
                                        6.0,
                                      ),
                                      child: Text(
                                        list[index].community_title,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${getTranslated('>', context)}",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : SizedBox.shrink()
                : ProductShimmer(
                    isEnabled: provider.firstLoading,
                    isHomePage: false,
                  ),
            provider.filterIsLoading
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.minScrollExtent ==
          _scrollController.position.pixels) {
        _loadData(context, true);

        setState(() {});
      }
    });

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Bar
                CustomSliverAppBar("", isHome: true),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImageUploadPage(),
                              ),
                            )
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: AssetImage(
                                Images.ai_test2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ConsultantListScreen(),
                              ),
                            )
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: AssetImage(
                                Images.consult,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Stack(
                          children: [
                            Center(
                              // width: 170,
                              child: Text(
                                "${getTranslated('BEAUTY_PRODUCT', context)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              // width: 170,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductListScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "${getTranslated('VIEW_MORE', context)}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 180,
                        endIndent: 180,
                        color: Colors.black54,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      ProductView(
                        isHomePage: true,
                        scrollController: _scrollController,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                        child: Stack(
                          children: [
                            Center(
                              // width: 170,
                              child: Text(
                                "${getTranslated('COMMUNITY', context)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              // width: 170,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CommunityHomeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "${getTranslated('VIEW_MORE', context)}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 180,
                        endIndent: 180,
                        color: Colors.black54,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 4,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      buildCommunity(),
                      const Divider(
                        height: 4,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
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
