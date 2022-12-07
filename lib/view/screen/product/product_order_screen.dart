import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_order_screen.dart';

import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import '../home/home_screens.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class ProductOrderPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ProductOrderPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ProductOrderPage> createState() => _ProductOrderPageState();
}

class _ProductOrderPageState extends State<ProductOrderPage>
    with TickerProviderStateMixin {
  TextEditingController _firstNameController = TextEditingController();
  bool radioButton = false;

  @override
  void initState() {
    super.initState();
    // _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('REVIEW_WRITE', context)}",
              ).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  // decoration: BoxDecoration(
                  //   color: Color(0xffcfcbc3),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                fit: BoxFit.fill,
                                height: 20,
                              ), // Text(key['title']),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                            child: Text(
                              "주문내역을 확인해주세요 :)",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 12, 0, 18),
                            child: Text(
                              "다른 상품들은 ",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 18),
                            child: Text(
                              "'마이페이지 > 주문내역'",
                              style: TextStyle(
                                color: Color(0xff0123B4),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 18),
                            child: Text(
                              " 에서 확인할 수 있어요.",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                fit: BoxFit.fill,
                                height: 107,
                              ), // Text(key['title']),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "주문서번호:2022112492135423",
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 9,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(60, 0, 20, 0),
                                      child: Text(
                                        "결제 완료",
                                        style: TextStyle(
                                          color: Color(0xff7700FF),
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "[ALOS] 마스크팩 3입",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "색상 : 투명",
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 13,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        "|",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "수량 : 1개",
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 13,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        "|",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "2022.11.21",
                                      style: TextStyle(
                                        color: Color(0xff999999),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "10,500원",
                                  style: TextStyle(
                                    color: Color(0xff0123B4),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 15),
                        child: Text(
                          "주문하시는 분",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                          ),
                        ),
                      ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _firstNameController,
                              labelText:
                                  "${getTranslated('ADDRESS', context)} ",
                              essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: CustomLabelTextField(
                                controller: _firstNameController,
                                labelText: "",
                                essentialLabelText: "",
                                hintText:
                                    "${getTranslated('SELECT_DISTINCT', context)}",
                              ),
                            ),
                          ),
                        ],
                      ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('EMAIL', context)} ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_EMAIL', context)}",
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                        child: Text(
                          "받으시는 분",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                          ),
                        ),
                      ),

                      CustomSmallRadioButton(
                        value: radioButton,
                        text: "주문자와 동일",
                        // reverse: true,
                      ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "배송지 ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      // CustomElevatedButton(
                      //   onTap: () async {
                      //     Navigator.of(context).pushAndRemoveUntil(
                      //         MaterialPageRoute(
                      //           builder: (_) => HomePage(),
                      //         ),
                      //         (route) => false);
                      //   },
                      //   buttonText: "홈으로",
                      // ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
