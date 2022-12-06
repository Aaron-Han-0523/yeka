import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../consultant/consultant_my_reserve_screen.dart';
import '../consultant/consultant_result_screen.dart';
import 'mypage_order_detail_screen.dart';

class MyPageOrderScreen extends StatefulWidget {
  @override
  State<MyPageOrderScreen> createState() => _MyPageOrderScreenState();
}

class _MyPageOrderScreenState extends State<MyPageOrderScreen> {
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
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "주문 내역",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
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
                                            MyPageOrderDetailPage(),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(150.0),
                                        child: Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                          fit: BoxFit.fill,
                                          height: 80,
                                        ), // Text(key['title']),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "주문서번호:2022112492135423",
                                                  style: TextStyle(
                                                    color: Color(0xffbbbbbb),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "결제 완료",
                                                  style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "[ALOS]마스크팩 3입",
                                              style: TextStyle(
                                                color: Color(0xff121212),
                                                fontSize: 22,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "색상 : 투명",
                                                  style: TextStyle(
                                                    color: Color(0xffbbbbbb),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Color(0xffbbbbbb),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "수량 : 1개",
                                                  style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Color(0xffbbbbbb),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  "2022.11.21",
                                                  style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            Text(
                                              "10,500원",
                                              style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
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
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: FooterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
