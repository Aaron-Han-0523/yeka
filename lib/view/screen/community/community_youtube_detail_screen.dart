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
                  "${getTranslated('YTUBE_MOVIE_AND_COLUM', context)}",
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
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "깔끔하게 보이는 피부 !! 나에게 맞는 피부는 상세하게 관리하기",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "BYHER(바이허)",
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
                                  "2시간 전",
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff999999),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(228, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Images.eye1,
                                        fit: BoxFit.cover,
                                        width: 12,
                                      ),
                                      Text(
                                        "456회",
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
                            "안녕하세요 고객님 :) \n고객님의 고충을 듣고 참지 못해 이렇게 글을 작성하게 되네요 ^^ \n피부를 어떻게 관리해야 깔끔하게 보일 수 있을까요 ㅎㅎ \n10년차 강남피부과 전문의 차세원 원장님의 리뷰영상을 가져와봤습니다 . \n많은 도움이 되셨길 바라면서 오늘 하루도 좋은하루 보내시길 바라겠습니다. \n많이 시청해주세요 ^^",
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
                                          padding: const EdgeInsets.fromLTRB(
                                              20.0, 9.0, 0.0, 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                titleList[position],
                                                style: TextStyle(
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "BYHER(바이허)",
                                                    style: TextStyle(
                                                        fontSize: 7.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            Color(0xff999999)),
                                                  ),
                                                  Text(
                                                    "${getTranslated('|', context)}",
                                                    style: TextStyle(
                                                        fontSize: 7.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            Color(0xff999999)),
                                                  ),
                                                  Text(
                                                    "7일전",
                                                    style: TextStyle(
                                                        fontSize: 7.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            Color(0xff999999)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(189, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          Images.eye1,
                                                          fit: BoxFit.cover,
                                                          width: 12,
                                                        ),
                                                        Text(
                                                          "723회",
                                                          style: TextStyle(
                                                              fontSize: 7.0,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              color: Color(
                                                                  0xff999999)),
                                                        ),
                                                      ],
                                                    ),
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
                                          padding: const EdgeInsets.all(8.0),
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
                                  height: 1,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                  color: Color(0xffEEEEEE),
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
