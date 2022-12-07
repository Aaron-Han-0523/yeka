import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/community/community_crud_screen.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'community_free_board_detail_screen.dart';

class CommunityFreeBoardListScreen extends StatefulWidget {
  @override
  State<CommunityFreeBoardListScreen> createState() =>
      _CommunityFreeBoardListScreenState();
}

class _CommunityFreeBoardListScreenState
    extends State<CommunityFreeBoardListScreen> {
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
                  "커뮤니티",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                                TextOverflow
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
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                          ],
                        ),
                      ),
                      ActionButton(),
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
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                CommunityCRUDScreen(),
          ),
        );
      },
      buttonText: '${getTranslated('GO_WRITING', context)}',
    );
  }
}
