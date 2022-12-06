import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_payment_screen.dart';

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

class ProductShippingPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ProductShippingPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ProductShippingPage> createState() => _ProductShippingPageState();
}

class _ProductShippingPageState extends State<ProductShippingPage>
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
                  // alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  // decoration: BoxDecoration(
                  //   color: Color(0xffcfcbc3),
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(150.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                              fit: BoxFit.fill,
                              height: 20,
                            ), // Text(key['title']),
                          ),
                          Text(
                            "잠깐",
                            style: TextStyle(
                              color: Color(0xff121212),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        "구매하시려는 상품정보를 반드시 확인해주세요 :)",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                        ),
                      ),

                      Row(
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "판매가",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "8,000원",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "배송비",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "2,500원",
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                Divider(
                                  height: 5,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: Color(0xffff0000),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      "결제금액",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
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
                              ],
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffff0000),
                      ),
                      
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Text(
                        "주문하시는 분",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12,
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
                              labelText: "${getTranslated('ADDRESS', context)} ",
                              essentialLabelText: " *",
                              hintText: "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: CustomLabelTextField(
                                controller: _firstNameController,
                                labelText: "",
                                essentialLabelText: "",
                                hintText: "${getTranslated('SELECT_DISTINCT', context)}",
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

                      Text(
                        "받으시는 분",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12,
                        ),
                      ),

                      CustomSmallRadioButton(
                        value: radioButton,
                        text: "${getTranslated('ALL_AGREE', context)}",
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

                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('ADDRESS', context)} ",
                              essentialLabelText: " *",
                              hintText: "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: CustomLabelTextField(
                                controller: _firstNameController,
                                labelText: "",
                                essentialLabelText: "",
                                hintText: "${getTranslated('SELECT_DISTINCT', context)}",
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

                      CustomElevatedButton(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductPaymentPage(),
                            ),
                          );
                        },
                        buttonText: "결제하러 가기",
                      ),
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
