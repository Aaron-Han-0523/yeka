import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class MyPageNoticeBoardDetailScreen extends StatefulWidget {
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
                  "커뮤니티",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          // CustomElevatedButton(
                          //     onTap: () {}, buttonText: "더보기 ∨"),
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
                          Text(
                            "안녕 쁘띠들아!\n피부 마스크팩 추천 좀 내가 코디해줌 ^^",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          ),
                        ],
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
