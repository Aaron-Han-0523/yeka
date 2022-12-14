import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
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
                  "${getTranslated('COMMUNITY', context)}",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // YoutubePlayer(
                      //   controller: _youtubeController,
                      //   liveUIColor: Colors.amber,
                      // ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.width * 0.56,
                            child: PageView(
                              children: items,
                              controller: _pageController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
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
                              "피부 블렉헤드 제거에 어울리는 마스크팩 추천좀 내가해줌",
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
                                    "rudtjr7871",
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
                                    "2${getTranslated('HOURS_AGO', context)}",
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff999999),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(238, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Images.eye1,
                                          fit: BoxFit.cover,
                                          width: 12,
                                        ),
                                        Text(
                                          "456${getTranslated('TIMES', context)}",
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
                            Text(
                              "안녕 쁘띠들아!\n피부 마스크팩 추천 좀 내가 코디해줌 ^^",
                              style: TextStyle(
                                fontSize: 10.0,
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
                                              titleList[position],
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
                                                  "${getTranslated('YEKA', context)}",
                                                  style: TextStyle(
                                                    fontSize: 7.0,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff999999),
                                                  ),
                                                ),
                                                Text(
                                                  "${getTranslated('|', context)}",
                                                  style: TextStyle(
                                                    fontSize: 7.0,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff999999),
                                                  ),
                                                ),
                                                Text(
                                                  "7${getTranslated('DAYS_AGO', context)}",
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
                                                        "723${getTranslated('TIMES', context)}",
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
                          itemCount: titleList.length,
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
