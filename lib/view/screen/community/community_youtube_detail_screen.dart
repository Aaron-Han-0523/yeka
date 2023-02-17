import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/model/response/community_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/youtube_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/community_youtube_provider.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class CommunityYoutubeDetailScreen extends StatefulWidget {
  final CommunityModel communityModel;

  const CommunityYoutubeDetailScreen({Key key, this.communityModel})
      : super(key: key);

  @override
  State<CommunityYoutubeDetailScreen> createState() =>
      _CommunityYoutubeDetailScreenState();
}

class _CommunityYoutubeDetailScreenState
    extends State<CommunityYoutubeDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  List<CommunityModel> communityNewsList = [];
  List<ImageModel> imageList = [];

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<CommunityYoutubeProvider>(context, listen: false)
        .getCommunityNewsList(widget.communityModel, context);

    communityNewsList =
        await Provider.of<CommunityYoutubeProvider>(context, listen: false)
            .communityNewsList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, true);
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
                  "${getTranslated('YOUTUBE_MOVIE_AND_COLUM', context)}",
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
                                flags: const YoutubePlayerFlags(
                                  mute: false,
                                  autoPlay: false,
                                  disableDragSeek: true,
                                  loop: false,
                                  isLive: false,
                                  forceHD: false,
                                  enableCaption: true,
                                ),
                              ),
                              liveUIColor: Colors.amber,
                            )
                          : Container(),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                                Text(
                                  "${widget.communityModel.writer ?? ""}|${widget.communityModel.create_date ?? ""}",
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
                        child: Container(
                          width: 400,
                          child: Text(
                            "${widget.communityModel.community_content ?? ""}",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffEEEEEE),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 13, 0, 0),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.question,
                              fit: BoxFit.cover,
                              width: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                              child: Text(
                                "${getTranslated('WANT_NEXT_NEWS', context)}",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Consumer<CommunityYoutubeProvider>(
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
                                          CommunityYoutubeDetailScreen(communityModel: communityNewsList[index],),
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
                                              image: YoutubeConverter.getYoutubeThumbnail(
                                                "${communityNewsList[index].community_link ?? ""}",
                                              ),
                                              fit: BoxFit.fitWidth,
                                              width: 83,
                                              imageErrorBuilder: (BuildContext context, Object exception,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${communityNewsList[index].writer ?? ""}${getTranslated('|', context)}${DateConverter.fromNowDuration(communityNewsList[index].create_date) ?? ""}",
                                                    style: TextStyle(
                                                      fontSize: 7.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Color(0xff999999),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
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
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Color(
                                                                0xff999999),
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
                        },
                      ),
                      // FooterPage(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FooterPage(),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
