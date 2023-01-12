import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/community_youtube_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_crud_screen.dart';
import 'community_youtube_widget.dart';

class CommunityYoutubeListScreen extends StatefulWidget {
  @override
  State<CommunityYoutubeListScreen> createState() =>
      _CommunityYoutubeListScreenState();
}

class _CommunityYoutubeListScreenState
    extends State<CommunityYoutubeListScreen> {
  final ScrollController _scrollController = ScrollController();

  int totalPageSize = 0;
  int currentPageNum = 0;
  int lastPageNum = 0;

  _loadPage(int pageNum) {
    currentPageNum = pageNum;

    setState(() {
      Provider.of<CommunityYoutubeProvider>(context, listen: false)
          .getCommunityList(pageNum + 1, context);
    });
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<CommunityYoutubeProvider>(context, listen: false)
        .getCommunityList(0, context);

    currentPageNum =
        Provider.of<CommunityYoutubeProvider>(context, listen: false)
            .currentPageNum;
    totalPageSize =
        Provider.of<CommunityYoutubeProvider>(context, listen: false)
            .totalPageSize;
    lastPageNum = (totalPageSize / 10).ceil();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, true);
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.minScrollExtent ==
          _scrollController.position.pixels) {
        _loadData(context, true);
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
                "${getTranslated('YOUTUBE_MOVIE_AND_COLUM', context)}",
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
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
                              communityList =
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
                                              return CommunityYoutubeWidget(
                                                  communityModel:
                                                      communityList[index]);
                                            },
                                          )
                                        : SizedBox.shrink()
                                    : ProductShimmer(
                                        isEnabled:
                                            communityProvider.firstLoading,
                                        isHomePage: false,
                                      ),
                                communityProvider.filterIsLoading
                                    ? Center(
                                        child: Padding(
                                        padding: EdgeInsets.all(
                                            Dimensions.ICON_SIZE_EXTRA_SMALL),
                                        child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Theme.of(context)
                                                        .primaryColor)),
                                      ))
                                    : SizedBox.shrink(),
                              ]);
                            },
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (currentPageNum > 0)
                                InkWell(
                                  child: Text(" < "),
                                  onTap: () {
                                    _loadPage(currentPageNum - 1);
                                  },
                                ),
                              for (var i = (currentPageNum - 2);
                                  i < currentPageNum + 3;
                                  i++)
                                if (i > -1 && i < lastPageNum)
                                  if (i == currentPageNum)
                                    Text(
                                      " ${i + 1} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )
                                  else
                                    InkWell(
                                      child: Text(" ${i + 1} "),
                                      onTap: () {
                                        _loadPage(i);
                                      },
                                    ),
                              if (currentPageNum < lastPageNum - 1)
                                InkWell(
                                  child: Text(" > "),
                                  onTap: () {
                                    _loadPage(currentPageNum + 1);
                                  },
                                ),
                            ],
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        ],
                      ),
                    ),
                    Provider.of<AuthProvider>(context, listen: false)
                                    .getUser()["user_type"] !=
                                null &&
                            Provider.of<AuthProvider>(context, listen: false)
                                    .getUser()["user_type"] ==
                                1
                        ? CustomElevatedButton(
                            width: 150,
                            onTap: () {
                              CommunityModel communityModel = CommunityModel(community_type: 1);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CommunityCRUDScreen(communityModel: communityModel),
                                ),
                              ).then((value) => setState(() {
                                _loadData(context, true);
                              }));
                            },
                            buttonText: '${getTranslated('GO_WRITING', context)}',
                          )
                        : Container(),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    FooterPage(),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}