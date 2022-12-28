import 'package:flutter/material.dart';

import 'package:yeka/util/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../localization/language_constants.dart';
import '../../../util//images.dart';
import '../../../util/app_constants.dart';
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
                                    "${widget.communityModel != null ? widget.communityModel.community_title : ""}",
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
                                        "${widget.communityModel != null ? widget.communityModel.writer : ""}|${widget.communityModel != null ? widget.communityModel.create_date : ""}",
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
                                            "${widget.communityModel.views}${getTranslated('TIMES', context)}",
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
                                child: FadeInImage.assetNetwork(
                                  placeholder: Images.placeholder1,
                                  image: widget.communityModel.community_link,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width * 0.28,
                                  height: MediaQuery.of(context).size.width * 0.28,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    "${widget.communityModel != null ? widget.communityModel.community_content : ""}",
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
