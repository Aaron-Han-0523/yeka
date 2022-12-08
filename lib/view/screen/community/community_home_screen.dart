import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
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
                  "${getTranslated('COMMUNITY', context)}",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          // widget.reviewModel.attachedFilepath1,
                          // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                          // fit: BoxFit.fitWidth,
                          // fit: BoxFit.fitHeight,
                          // width: MediaQuery.of(context).size.width * 1,
                          // height: MediaQuery.of(context).size.height * 0.55,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          // CustomElevatedButton(
                          //     onTap: () {}, buttonText: "더보기 ∨"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  // widget.reviewModel.attachedFilepath1,
                                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                  Images.video_file,
                                  fit: BoxFit.cover,
                                  width: 20,
                                  // height: MediaQuery.of(context).size.width * 0.4,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 118, 0),
                                  child: Text(
                                    "${getTranslated('BOARD_YOUTUBE_COLUMN', context)}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "${getTranslated('VIEW_MORE', context)}",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                          Container(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, position) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CommunityYoutubeDetailScreen(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20.0, 5.0, 20.0, 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: Text(
                                                      titleList[position],
                                                      style: TextStyle(
                                                        fontSize: 11.0,
                                                        fontWeight: FontWeight.bold,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "YEKA(예카)",
                                                          style: TextStyle(
                                                              fontSize: 7.0,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              color:
                                                                  Color(0xff999999)
                                                          ),
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
                                                              Color(0xff999999)
                                                          ),
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
                                                              Color(0xff999999)
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(158, 0, 0, 5),
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
                                                                    color:
                                                                    Color(0xff999999)
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
                                            Container(
                                              width: 82,
                                              child: Image.network(
                                                // widget.reviewModel.attachedFilepath1,
                                                // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                                YoutubeThumbnailConverter
                                                    .getYoutubeThumbnail(
                                                        "https://www.youtube.com/watch?v=-QhZnyAgKZk"),
                                                fit: BoxFit.fitWidth,
                                                width: 165,
                                                height: 49,
                                                // height: MediaQuery.of(context).size.width * 0.4,
                                              ),
                                            ),
                                          ],
                                        ),
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
                        ],
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
                                      width: 20,
                                      // height: MediaQuery.of(context).size.width * 0.4,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        "${getTranslated('FREE_BULLETIN_BOARD', context)}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                      "${getTranslated('VIEW_MORE', context)}",
                                      style: TextStyle(
                                        fontSize: 10,
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
                                              child: Image.network(
                                                // widget.reviewModel.attachedFilepath1,
                                                // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                                YoutubeThumbnailConverter
                                                    .getYoutubeThumbnail(
                                                        "https://www.youtube.com/watch?v=-QhZnyAgKZk"),
                                                fit: BoxFit.fitWidth,
                                                width: 165,
                                                height: 49,
                                                // height: MediaQuery.of(context).size.width * 0.4,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15.0, 12.0, 0.0, 20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      titleList[position],
                                                      style: TextStyle(
                                                        fontSize: 11.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "YEKA(예카)",
                                                              style: TextStyle(
                                                                fontSize: 7.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(0xff999999),
                                                              ),
                                                            ),
                                                            Text(
                                                              "${getTranslated('|', context)}",
                                                              style: TextStyle(
                                                                fontSize: 7.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(0xff999999),
                                                              ),
                                                            ),
                                                            Text(
                                                              "7일전",
                                                              style: TextStyle(
                                                                fontSize: 7.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(0xff999999),
                                                              ),
                                                            ),
                                                          ],
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
                                                                fontSize: 7.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(0xff999999),
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
                                        height: 2,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Color(0xffffEEEEEE),
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
