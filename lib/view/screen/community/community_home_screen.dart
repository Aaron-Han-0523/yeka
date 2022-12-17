import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/community_freeboard_provider.dart';
import '../../../provider/community_provider.dart';
import '../../../provider/community_youtube_provider.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/product_shimmer.dart';
import 'community_free_board_list_screen.dart';
import 'community_free_board_widget.dart';
import 'community_youtube_list_screen.dart';
import 'community_youtube_widget.dart';

class CommunityHomeScreen extends StatefulWidget {
  @override
  State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<CommunityYoutubeProvider>(context, listen: false)
        .getLatestCommunityList(0, context, reload: reload);

    Provider.of<CommunityFreeBoardProvider>(context, listen: false)
        .getLatestCommunityList(0, context, reload: reload);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('COMMUNITY', context)}",
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.topCenter,
                                  image: new AssetImage(Images.community_main,),
                                )
                            ),
                          ),
                          Positioned(
                            top: 37,
                            left: 20,
                            child: Text(
                              "뷰티인들과 함꼐하는 소통의 광장",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff333333),
                                overflow: TextOverflow.ellipsis,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 18,
                            child: Container(
                              width: 96,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Color(0x550077ff),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 57,
                            left: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  Images.logo_b,
                                  fit: BoxFit.fitHeight,
                                  height: 23,
                                ),
                                Text(
                                  "  ",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  "커뮤니티",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.PADDING_SIZE_SMALL,
                            Dimensions.PADDING_SIZE_DEFAULT,
                            Dimensions.PADDING_SIZE_SMALL),
                        child: Column(
                          children: [
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            // CustomElevatedButton(
                            //     onTap: () {}, buttonText: "더보기 ∨"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      // widget.reviewModel.attachedFilepath1,
                                      // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                      Images.video_file,
                                      fit: BoxFit.cover,
                                      width: 20,
                                      // height: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "${getTranslated('BOARD_YOUTUBE_COLUMN', context)}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityYoutubeListScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  Dimensions.HOME_PAGE_PADDING,
                                  0,
                                  Dimensions.PADDING_SIZE_DEFAULT,
                                  Dimensions.PADDING_SIZE_SMALL),
                              child: Column(
                                children: [
                                  // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  // CustomElevatedButton(
                                  //     onTap: () {}, buttonText: "더보기 ∨"),
                                  Consumer<CommunityYoutubeProvider>(
                                    builder: (context, communityProvider, child) {
                                      List<CommunityModel> communityList = [];
                                      communityList = communityProvider.latestCommunityList;

                                      print('========hello hello===>${communityList.length}');

                                      return Column(children: [
                                        !communityProvider.filterFirstLoading
                                            ? communityList.length != 0
                                            ? StaggeredGridView.countBuilder(
                                          itemCount: communityList.length > 4
                                              ? 4
                                              : communityList.length,
                                          crossAxisCount: 1,
                                          padding: EdgeInsets.all(0),
                                          physics: NeverScrollableScrollPhysics(),
                                          // scrollDirection:
                                          //     isHomePage ? Axis.horizontal : Axis.vertical,
                                          shrinkWrap: true,
                                          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                                          itemBuilder: (BuildContext context, int index) {
                                            return CommunityYoutubeWidget(communityModel: communityList[index]);
                                          },
                                        )
                                            : SizedBox.shrink()
                                            : ProductShimmer(
                                          isEnabled: communityProvider.firstLoading, isHomePage: false,),
                                        communityProvider.filterIsLoading
                                            ? Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                                              child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context).primaryColor)),
                                            ))
                                            : SizedBox.shrink(),
                                      ]);
                                    },
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.PADDING_SIZE_SMALL,
                            Dimensions.PADDING_SIZE_DEFAULT,
                            Dimensions.PADDING_SIZE_SMALL),
                        child: Column(
                          children: [
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      // widget.reviewModel.attachedFilepath1,
                                      // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                      Images.free,
                                      fit: BoxFit.cover,
                                      width: 20,
                                      // height: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "${getTranslated('FREE_BULLETIN_BOARD', context)}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityFreeBoardListScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  Dimensions.HOME_PAGE_PADDING,
                                  0,
                                  Dimensions.PADDING_SIZE_DEFAULT,
                                  Dimensions.PADDING_SIZE_SMALL),
                              child: Column(
                                children: [
                                  // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  // CustomElevatedButton(
                                  //     onTap: () {}, buttonText: "더보기 ∨"),
                                  Consumer<CommunityFreeBoardProvider>(
                                    builder: (context, communityProvider, child) {
                                      List<CommunityModel> communityList = [];
                                      communityList = communityProvider.latestCommunityList;

                                      print('========hello hello===>${communityList.length}');

                                      return Column(children: [
                                        !communityProvider.filterFirstLoading
                                            ? communityList.length != 0
                                            ? StaggeredGridView.countBuilder(
                                          itemCount: communityList.length > 4
                                              ? 4
                                              : communityList.length,
                                          crossAxisCount: 1,
                                          padding: EdgeInsets.all(0),
                                          physics: NeverScrollableScrollPhysics(),
                                          // scrollDirection:
                                          //     isHomePage ? Axis.horizontal : Axis.vertical,
                                          shrinkWrap: true,
                                          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                                          itemBuilder: (BuildContext context, int index) {
                                            return CommunityFreeBoardWidget(communityModel: communityList[index]);
                                          },
                                        )
                                            : SizedBox.shrink()
                                            : ProductShimmer(
                                          isEnabled: communityProvider.firstLoading, isHomePage: false,),
                                        communityProvider.filterIsLoading
                                            ? Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                                              child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context).primaryColor)),
                                            ))
                                            : SizedBox.shrink(),
                                      ]);
                                    },
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
