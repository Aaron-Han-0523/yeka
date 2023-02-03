import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../helper/youtube_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/community_freeboard_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_update_screen.dart';

class CommunityFreeBoardDetailScreen extends StatefulWidget {
  final CommunityModel communityModel;

  const CommunityFreeBoardDetailScreen({Key key, this.communityModel})
      : super(key: key);

  @override
  State<CommunityFreeBoardDetailScreen> createState() =>
      _CommunityFreeBoardDetailScreenState();
}

class _CommunityFreeBoardDetailScreenState
    extends State<CommunityFreeBoardDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  PageController _pageController = PageController();
  List<CommunityModel> communityNewsList = [];
  List<ImageModel> imageList = [];

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<CommunityFreeBoardProvider>(context, listen: false)
        .getCommunityNewsList(widget.communityModel, context);

    communityNewsList =
        await Provider.of<CommunityFreeBoardProvider>(context, listen: false)
            .communityNewsList;

    ImageModel imageModel = ImageModel(community_id: widget.communityModel.id);
    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByCommunityId(imageModel);

    imageList = await Provider.of<CustomImageProvider>(context, listen: false)
        .imageList;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _loadData(context, true);
  }

  Widget buildPage(String url) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: FadeInImage.assetNetwork(
            placeholder: Images.placeholder1,
            image: url != null
                ? AppConstants.BASE_URL + "/" + url
                : AppConstants.BASE_URL + "/placeholder_1x1.png",
            fit: BoxFit.fitHeight,
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.width * 0.28,
            imageErrorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Container();
            }));
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
                      widget.communityModel.community_link != ""
                          ? YoutubePlayer(
                              controller: YoutubePlayerController(
                                // initialVideoId: 'iLnmTe5Q2Qw',
                                initialVideoId: YoutubeConverter.convertUrlToId(
                                    widget.communityModel.community_link),
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  isLive: false,
                                ),
                              ),
                              liveUIColor: Colors.amber,
                            )
                          : Container(),

                      Consumer<CustomImageProvider>(
                        builder: (context, imageProvider, child) {
                          double width = MediaQuery.of(context).size.width;
                          List<ImageModel> imageList = imageProvider.imageList;

                          print('========hello hello===>${imageList.length}');

                          List<Widget> items = [];

                          for (var i = 0; i < imageList.length; i++) {
                            items.add(buildPage(imageList[i].path));
                          }

                          return imageList.length == 0
                              ? Container()
                              : Stack(
                                  children: [
                                    Container(
                                      width: width * 1,
                                      height: width * 0.56,
                                      child: PageView(
                                        children: items,
                                        controller: _pageController,
                                      ),
                                    ),
                                    Container(
                                      width: width * 1,
                                      height: width * 0.56,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: ScrollingPageIndicator(
                                            dotColor: Colors.grey,
                                            dotSelectedColor: Colors.deepPurple,
                                            dotSize: 7,
                                            dotSelectedSize: 7,
                                            dotSpacing: 18,
                                            controller: _pageController,
                                            itemCount: items.length,
                                            orientation: Axis.horizontal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                        },
                      ),

                      // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 23.0, 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.communityModel.community_title ?? ""}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "${widget.communityModel.writer ?? ""}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('|', context)}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                      Text(
                                        "${widget.communityModel.create_date ?? ""}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Images.eye1,
                                        fit: BoxFit.cover,
                                        width: 12,
                                      ),
                                      Text(
                                        " ${widget.communityModel.views ?? ""}${getTranslated('TIMES', context)}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xffEEEEEE),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "${widget.communityModel.community_content ?? ""}",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    CommunityModel communityModel =
                                        CommunityModel(community_type: 2);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommunityUpdateScreen(
                                                  communityModel:
                                                      communityModel,
                                                )));
                                  },
                                  child: Text(
                                    "${getTranslated('MODIFICATION', context)}",
                                    style: TextStyle(
                                      color: Color(0xff0123B4),
                                      fontSize: 8,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              height: 3,
                              thickness: 1,
                              color: Color(0xffEEEEEE),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 13, 20, 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                              child: Image.asset(
                                Images.question,
                                fit: BoxFit.cover,
                                width: 18,
                              ),
                            ),
                            Text(
                              "${getTranslated('WANT_NEXT_NEWS', context)}",
                              style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Consumer<CommunityFreeBoardProvider>(
                          builder: (context, communityProvider, child) {
                        List<CommunityModel> communityNewsList =
                            communityProvider.communityNewsList;

                        print(
                            '========hello hello===>${communityNewsList.length}');

                        return StaggeredGridView.countBuilder(
                          itemCount: communityNewsList.length,
                          crossAxisCount: 1,
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),
                          // scrollDirection:
                          //     isHomePage ? Axis.horizontal : Axis.vertical,
                          shrinkWrap: true,
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.fit(1),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CommunityFreeBoardDetailScreen(
                                      communityModel: communityNewsList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 15, 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: Images.placeholder1,
                                            image: YoutubeConverter
                                                .getYoutubeThumbnail(
                                              "${communityNewsList[index].community_link ?? ""}",
                                            ),
                                            fit: BoxFit.fitWidth,
                                            width: 83,
                                            imageErrorBuilder:
                                                (BuildContext context,
                                                    Object exception,
                                                    StackTrace stackTrace) {
                                              return Image.asset(
                                                Images.placeholder1,
                                                fit: BoxFit.fitHeight,
                                                height: 60,
                                                width: 83,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${communityNewsList[index].community_title ?? ""}",
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${communityNewsList[index].writer ?? ""}${getTranslated('|', context)}${DateConverter.fromNowDuration(communityNewsList[index].create_date) ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 7.0,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff999999),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 22, 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        Images.eye1,
                                                        fit: BoxFit.cover,
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        " ${communityNewsList[index].views ?? ""}${getTranslated('TIMES', context)}",
                                                        style: TextStyle(
                                                          fontSize: 7.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color:
                                                              Color(0xff999999),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),

                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),

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
