import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_free_board_detail_screen.dart';
import 'community_free_board_list_screen.dart';
import 'community_youtube_detail_screen.dart';
import 'community_youtube_list_screen.dart';

class CommunityHomeScreen extends StatefulWidget {
  @override
  State<CommunityHomeScreen> createState() => _CommunityHomeScreenState();
}

class _CommunityHomeScreenState extends State<CommunityHomeScreen> {
  final ScrollController _scrollController = ScrollController();

  var titleList = [
    "제 피부톤에 ?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
  ];

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
                  "커뮤니티",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          child: Image.network(
                            // widget.reviewModel.attachedFilepath1,
                            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                            // fit: BoxFit.fitWidth,
                            // width: MediaQuery.of(context).size.width * 0.9,
                            // height: MediaQuery.of(context).size.width * 0.4,
                          ),
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
                                      width: 30,
                                      // height: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    Text(
                                      "유튜브 및 칼럼 게시판",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
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
                                      "VIEW MORE >",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

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
                                      Images.free,
                                      fit: BoxFit.cover,
                                      width: 30,
                                      // height: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    Text(
                                      "자유게시판",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
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
                                      "VIEW MORE >",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

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
