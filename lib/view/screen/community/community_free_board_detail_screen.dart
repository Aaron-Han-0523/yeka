import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:yeka/data/model/response/community_model.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/helper/date_converter.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/community_freeboard_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

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

  YoutubePlayerController _youtubeController;
  PageController _pageController = PageController();
  List<CommunityModel> communityNewsList = [];
  List<ImageModel> imageList = [];

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<CommunityFreeBoardProvider>(context, listen: false)
        .getCommunityNewsList(widget.communityModel, context);

    communityNewsList =
        Provider.of<CommunityFreeBoardProvider>(context, listen: false)
            .communityNewsList;

    ImageModel imageModel = ImageModel(community_id: widget.communityModel.id);
    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByCommunityId(imageModel);

    imageList =
        Provider.of<CustomImageProvider>(context, listen: false).imageList;
  }

  @override
  void didChangeDependencies() {
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
            : AppConstants.BASE_URL,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.28,
      )
      //
      // Image.network(
      //   'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
      //   // url != null ? AppConstants.BASE_URL + "/" + url : AppConstants.BASE_URL,
      //   fit: BoxFit.cover,
      // ),
    );
  }

  @override
  void initState() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      // flags: YoutubePLayerFlags(
      //   isLive: true,
      // ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    for (var i = 0; i < imageList.length; i++) {
      items.add(buildPage(imageList[i].path));
    }

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
                      widget.communityModel.community_link != null
                          ? YoutubePlayer(
                              controller: _youtubeController,
                              liveUIColor: Colors.amber,
                            )
                          : Container(),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.width * 0.56,
                            child: PageView(
                              children: items,
                              controller: _pageController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: MediaQuery.of(context).size.width * 0.56,
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
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.communityModel.community_title}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.communityModel.writer}",
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
                                    "${widget.communityModel.create_date}",
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff999999),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(160, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Images.eye1,
                                          fit: BoxFit.cover,
                                          width: 12,
                                        ),
                                        Text(
                                          " ${widget.communityModel.views}${getTranslated('TIMES', context)}",
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
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffEEEEEE),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                "${widget.communityModel.community_content}",
                                style: TextStyle(
                                  fontSize: 10.0,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffEEEEEE),
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
                      Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, position) {
                            return Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityFreeBoardDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 10, 15, 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            // widget.reviewModel.attachedFilepath1,
                                            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                            YoutubeThumbnailConverter
                                                .getYoutubeThumbnail(
                                                    "https://www.youtube.com/watch?v=-QhZnyAgKZk"),
                                            fit: BoxFit.fitWidth,
                                            width: 83,
                                            // height: 49,
                                            // height: MediaQuery.of(context).size.width * 0.4,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${communityNewsList[position].community_title}",
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${communityNewsList[position].writer}${getTranslated('|', context)}${DateConverter.fromNowDuration(communityNewsList[position].create_date)}",
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
                                                          145, 0, 22, 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        Images.eye1,
                                                        fit: BoxFit.cover,
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        " ${communityNewsList[position].views}${getTranslated('TIMES', context)}",
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
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xffEEEEEE),
                                ),
                              ],
                            );
                          },
                          itemCount: communityNewsList.length,
                        ),
                      ),

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
