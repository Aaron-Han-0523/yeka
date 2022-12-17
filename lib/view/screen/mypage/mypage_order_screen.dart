import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
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
                  "${getTranslated('ORDER___LIST', context)}",
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
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
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 123),
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
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(150.0),
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                                fit: BoxFit.fill,
                                                width: 100,
                                                height: 100,
                                              ), // Text(key['title']),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${getTranslated('ORDER_NUMBER', context)}:2022112492135423",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 7,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    Text(
                                                      "${getTranslated('PAYMENT_COMPLETED', context)}",
                                                      style: TextStyle(
                                                        color: Color(0xff0123B4),
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "[ALOS]마스크팩 3입",
                                                      style: TextStyle(
                                                          color: Color(0xff000000),
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "${getTranslated('COLOR_', context)}투명",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${getTranslated('|', context)}",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${getTranslated('AMOUNT_', context)}1${getTranslated('SOME', context)}",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${getTranslated('|', context)}",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "2022.11.21",
                                                      style: TextStyle(
                                                        color: Color(0xff999999),
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                                                Row(
                                                  children: [
                                                    Text(
                                                      "10,500${getTranslated('WON', context)}",
                                                      style: TextStyle(
                                                        color: Color(0xff0123B4),
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
