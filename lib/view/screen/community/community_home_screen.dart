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
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          // widget.reviewModel.attachedFilepath1,
                          // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                          // fit: BoxFit.fitWidth,
                          // fit: BoxFit.fitHeight,
                          // width: MediaQuery.of(context).size.width * 1,
                          // height: MediaQuery.of(context).size.height * 0.55,
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
