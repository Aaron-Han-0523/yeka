import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_crud_screen.dart';
import 'community_youtube_detail_screen.dart';

class CommunityYoutubeListScreen extends StatefulWidget {
  @override
  State<CommunityYoutubeListScreen> createState() =>
      _CommunityYoutubeListScreenState();
}

class _CommunityYoutubeListScreenState
    extends State<CommunityYoutubeListScreen> {
  final ScrollController _scrollController = ScrollController();

  var titleList = [
    "제 피부톤에 ?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
    "제 피부톤에 어떤 화장품이 잘 어울릴까요?333333",
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
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    children: [
                                                      Text(
                                                        "BYHER(바이허)",
                                                        style: TextStyle(
                                                          fontSize: 7.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          color: Color(0xff999999),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${getTranslated('|', context)}",
                                                        style: TextStyle(
                                                          fontSize: 7.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          color: Color(0xff999999),
                                                        ),
                                                      ),
                                                      Text(
                                                        "7일전",
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
                                                        padding: const EdgeInsets.fromLTRB(158, 0, 0, 0),
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
                                                                overflow: TextOverflow
                                                                    .ellipsis,
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

                                            Container(
                                              width: 82,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
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
