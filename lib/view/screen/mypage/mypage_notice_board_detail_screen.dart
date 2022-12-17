import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class MyPageNoticeBoardDetailScreen extends StatefulWidget {
  final CommunityModel communityModel;

  const MyPageNoticeBoardDetailScreen({Key key, this.communityModel}) : super(key: key);
  @override
  State<MyPageNoticeBoardDetailScreen> createState() =>
      _MyPageNoticeBoardDetailScreenState();
}

class _MyPageNoticeBoardDetailScreenState
    extends State<MyPageNoticeBoardDetailScreen> {
  final ScrollController _scrollController = ScrollController();

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
                  "${getTranslated('NOTICE', context)}",
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffDDDDDD),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.communityModel.community_title}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${widget.communityModel.writer}|${widget.communityModel.create_date}",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Color(0xff999999),
                                          fontWeight: FontWeight.bold,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            Images.eye1,
                                            fit: BoxFit.cover,
                                            width: 10,
                                          ),

                                          SizedBox(width: 3),

                                          Text(
                                            "456${getTranslated('TIMES', context)}",
                                            style: TextStyle(
                                              fontSize: 8.0,
                                              color: Color(0xff999999),
                                              fontWeight: FontWeight.bold,
                                              // overflow: TextOverflow.ellipsis,
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
                              height: 0,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                              color: Color(0xffDDDDDD),
                            ),
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                child: Image.network(
                                  // widget.reviewModel.attachedFilepath1,
                                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                  // 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                                  '${widget.communityModel.community_link}',
                                  // fit: BoxFit.fitWidth,
                                  // width: MediaQuery.of(context).size.width * 0.9,
                                  // height: MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "${widget.communityModel.community_content}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff333333)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 125,
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
