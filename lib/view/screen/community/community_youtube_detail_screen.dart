import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CommunityYoutubeDetailScreen extends StatefulWidget {
  @override
  State<CommunityYoutubeDetailScreen> createState() =>
      _CommunityYoutubeDetailScreenState();
}

class _CommunityYoutubeDetailScreenState
    extends State<CommunityYoutubeDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  YoutubePlayerController _controller;

  var titleList = [
    "제 피부톤에 ?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
  ];

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      // flags: YoutubePLayerFlags(
      //   isLive: true,
      // ),
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                      YoutubePlayer(
                        controller: _controller,
                        liveUIColor: Colors.amber,
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(
                            12.0, 12.0, 12.0, 6.0),
                        child: Column(
                          children: [
                            Text(
                              "깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight:
                                FontWeight.bold,
                                overflow:
                                TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceEvenly,
                              children: [
                                Text(
                                  "BYHER(바이허) | 2시간 전",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight:
                                    FontWeight.bold,
                                    overflow: TextOverflow
                                        .ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.eye1,
                                      fit: BoxFit.cover,
                                      width: 15,
                                    ),
                                    Text(
                                      "456회",
                                      style: TextStyle(
                                        fontSize: 12.0,
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
                              ],
                            ),
                          ],
                        ),
                      ),

                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey,
                      ),

                      Text(
                        "깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),

                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey,
                      ),

                      Row(
                        children: [
                          Image.asset(
                            Images.eye1,
                            fit: BoxFit.cover,
                            width: 15,
                          ),
                          Text(
                            "${getTranslated('WANT_NEXT_NEWS', context)}",
                            style: TextStyle(
                              fontSize: 12.0,
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

                      Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, position) {
                            return Column(
                              children: <Widget>[
                                InkWell(
                                  onTap:() {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CommunityYoutubeDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(
                                              12.0, 12.0, 12.0, 6.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                titleList[position],
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "BYHER(바이허) | 7일전",
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        Images.eye1,
                                                        fit: BoxFit.cover,
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        "723회",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            // widget.reviewModel.attachedFilepath1,
                                            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                            YoutubeThumbnailConverter
                                                .getYoutubeThumbnail(
                                                "https://www.youtube.com/watch?v=-QhZnyAgKZk"),
                                            fit: BoxFit.fitHeight,
                                            // width: 30,
                                            height: 49,
                                            // height: MediaQuery.of(context).size.width * 0.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 3,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                          itemCount: titleList.length,
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
