import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/community_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_crud_screen.dart';
import 'community_youtube_widget.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';

class CommunityYoutubeListScreen extends StatefulWidget {
  @override
  State<CommunityYoutubeListScreen> createState() =>
      _CommunityYoutubeListScreenState();
}

class _CommunityYoutubeListScreenState
    extends State<CommunityYoutubeListScreen> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<CommunityProvider>(context, listen: false)
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
                "${getTranslated('YTUBE_MOVIE_AND_COLUM', context)}",
              ).getAppbar(),
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
                          Consumer<CommunityProvider>(
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
                    ActionButton(),

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

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    key,
    this.onPressed,
    this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 150,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunityCRUDScreen(),
          ),
        );
      },
      buttonText: '${getTranslated('GO_WRITING', context)}',
    );
  }
}
