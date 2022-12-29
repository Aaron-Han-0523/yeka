import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:yeka/util/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/community_notice_provider.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/product_shimmer.dart';
import 'mypage_notice_board_detail_screen.dart';

class MyPageNoticeBoardListScreen extends StatefulWidget {
  @override
  State<MyPageNoticeBoardListScreen> createState() =>
      _MyPageNoticeBoardListScreenState(CommunityModel());
}

class _MyPageNoticeBoardListScreenState
    extends State<MyPageNoticeBoardListScreen> {
  final ScrollController _scrollController = ScrollController();
  final CommunityModel communityModel;

  int totalPageSize = 0;
  int currentPageNum = 0;
  int lastPageNum = 0;

  _MyPageNoticeBoardListScreenState(this.communityModel);

  _loadPage(int pageNum) {
    currentPageNum = pageNum;

    setState(() {
      Provider.of<CommunityNoticeProvider>(context, listen: false)
          .getCommunityList(pageNum + 1, context);
    });
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<CommunityNoticeProvider>(context, listen: false)
        .getCommunityList(0, context);

    currentPageNum = Provider.of<CommunityNoticeProvider>(context, listen: false).currentPageNum;
    totalPageSize = Provider.of<CommunityNoticeProvider>(context, listen: false).totalPageSize;
    lastPageNum = (totalPageSize / 10).ceil();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('NOTICE', context)}",isMyPageHidden: true,
                ),
                SliverToBoxAdapter(
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
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 75),
                        color: Colors.white,
                        child: Consumer<CommunityNoticeProvider>(
                          builder: (context, communityProvider, child) {
                            List<CommunityModel> communityList =
                                communityProvider.latestCommunityList;

                            print(
                                '========hello hello===>${communityList.length}');

                            return Column(children: [
                              !communityProvider.filterFirstLoading
                                  ? communityList.length != 0
                                      ? StaggeredGridView.countBuilder(
                                          itemCount: communityList.length,
                                          crossAxisCount: 1,
                                          padding: EdgeInsets.all(0),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          // scrollDirection:
                                          //     isHomePage ? Axis.horizontal : Axis.vertical,
                                          shrinkWrap: true,
                                          staggeredTileBuilder: (int index) =>
                                              StaggeredTile.fit(1),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: <Widget>[
                                                InkWell(
                                                  //fixme 확인필요!!
                                                  onTap: () async {
                                                    // CommunityModel latestCommunityModel = await Provider.of<CommunityNoticeProvider>(context, listen: false).getCommunity(communityModel);
                                                    // latestCommunityModel.views = latestCommunityModel.views + 1;
                                                    // Provider.of<CommunityNoticeProvider>(context, listen: false).updateCommunity(latestCommunityModel);

                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyPageNoticeBoardDetailScreen(),
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 15),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${getTranslated('BRACKETS_NOTICE', context)}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                      color: Color(
                                                                          0xFF333333),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    communityList[
                                                                            index]
                                                                        .community_title,
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.0,
                                                                      color: Color(
                                                                          0xFF333333),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${getTranslated('YEKA', context)}" +
                                                                            "${getTranslated('|', context)}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              8.0,
                                                                          color:
                                                                              Color(0xFF999999),
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${DateConverter.fromNowDuration(communityList[index].create_date)}${getTranslated('DAYS_AGO', context)}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              8.0,
                                                                          color:
                                                                              Color(0xFF999999),
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        Images
                                                                            .eye1,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              4),
                                                                      Text(
                                                                        //fixme 확인필요!!
                                                                        "${communityModel.views}"
                                                                        // "${communityList[index].views}"
                                                                            "${getTranslated('TIMES', context)}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              8.0,
                                                                          color:
                                                                              Color(0xff999999),
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                  thickness: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  color: Color(0xffdddddd),
                                                ),
                                              ],
                                            );
                                          },
                                        )
                                      : SizedBox.shrink()
                                  : ProductShimmer(
                                      isEnabled: communityProvider.firstLoading,
                                      isHomePage: false,
                                    ),
                              communityProvider.filterIsLoading
                                  ? Center(
                                      child: Padding(
                                      padding: EdgeInsets.all(
                                          Dimensions.ICON_SIZE_EXTRA_SMALL),
                                      child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Theme.of(context).primaryColor)),
                                    ))
                                  : SizedBox.shrink(),
                            ]);
                          },
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(currentPageNum > 0) InkWell(child: Text(" < "), onTap: () { _loadPage(currentPageNum - 1); },),
                          for (var i = (currentPageNum - 2); i < currentPageNum + 3; i++) if(i > -1 && i < lastPageNum) if(i == currentPageNum) Text(" ${i + 1} ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),) else InkWell(child: Text(" ${i + 1} "), onTap: () {_loadPage(i);},),
                          if(currentPageNum < lastPageNum - 1) InkWell(child: Text(" > "), onTap: () { _loadPage(currentPageNum + 1); },),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                      FooterPage(),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
