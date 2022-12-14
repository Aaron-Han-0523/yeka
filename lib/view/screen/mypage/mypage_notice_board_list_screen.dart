import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'mypage_notice_board_detail_screen.dart';

class MyPageNoticeBoardListScreen extends StatefulWidget {
  @override
  State<MyPageNoticeBoardListScreen> createState() => _MyPageNoticeBoardListScreenState();
}

class _MyPageNoticeBoardListScreenState extends State<MyPageNoticeBoardListScreen> {
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
                  "${getTranslated('NOTICE', context)}",
                ).getAppbar(),
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
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 75),
                        color: Colors.white,
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
                                            MyPageNoticeBoardDetailScreen(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(vertical: 15),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${getTranslated('BRACKETS_NOTICE', context)}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Color(0xFF333333),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),

                                                  Text(
                                                    titleList[position],
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Color(0xFF333333),
                                                      fontWeight: FontWeight.bold,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${getTranslated('YEKA', context)}"+"${getTranslated('|', context)}",
                                                        style: TextStyle(
                                                          fontSize: 8.0,
                                                          color: Color(0xFF999999),
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),

                                                      Text(
                                                        "7${getTranslated('DAYS_AGO', context)}",
                                                        style: TextStyle(
                                                          fontSize: 8.0,
                                                          color: Color(0xFF999999),
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        Images.eye1,
                                                        fit: BoxFit.cover,
                                                        width: 8,
                                                      ),

                                                      SizedBox(width: 4),

                                                      Text(
                                                        "723${getTranslated('TIMES', context)}",
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
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xffdddddd),
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
