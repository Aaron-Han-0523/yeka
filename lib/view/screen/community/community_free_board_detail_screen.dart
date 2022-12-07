import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class CommunityFreeBoardDetailScreen extends StatefulWidget {
  @override
  State<CommunityFreeBoardDetailScreen> createState() =>
      _CommunityFreeBoardDetailScreenState();
}

class _CommunityFreeBoardDetailScreenState
    extends State<CommunityFreeBoardDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  YoutubePlayerController _youtubeController;
  PageController _pageController = PageController();

  var titleList = [
    "제 피부톤에 ?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
  ];

  Widget buildPage(String text, Color color) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.6,
      // height: MediaQuery.of(context).size.width * 0.6,
      child: Image.network(
        // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
        fit: BoxFit.cover,
      ),
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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      buildPage("0", Colors.red),
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.brown)
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "커뮤니티",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      YoutubePlayer(
                        controller: _youtubeController,
                        liveUIColor: Colors.amber,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        child: PageView(
                          children: items,
                          controller: _pageController,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ScrollingPageIndicator(
                        dotColor: Colors.grey,
                        dotSelectedColor: Colors.deepPurple,
                        dotSize: 6,
                        dotSelectedSize: 8,
                        dotSpacing: 18,
                        controller: _pageController,
                        itemCount: items.length,
                        orientation: Axis.horizontal,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                        child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "BYHER(바이허) | 2시간 전",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
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
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
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
                        "안녕 쁘띠들아!\n피부 마스크팩 추천 좀 내가 코디해줌 ^^",
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
                            "다음 소식도 궁금해요!",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 12.0, 12.0, 6.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                titleList[position],
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                              FontWeight.bold,
                                                          overflow: TextOverflow
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