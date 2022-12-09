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
import '../../basewidget/textfield/custom_textfield.dart';
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
                "${getTranslated('DESTINATION_INPUT', context)}",
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
                      Divider(
                        height: 2,
                        color: Color(0xffDDDDDD),
                        indent: 0,
                        endIndent: 0,
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.asset(
                                Images.privacy,
                                fit: BoxFit.fill,
                                height: 25,
                              ), // Text(key['title']),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(7, 16, 0, 0),
                            child: Text(
                              "${getTranslated('STOP', context)}",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                        child: Text(
                          "${getTranslated('PLEASE_CHECK_IT', context)}",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 14,
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
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
                                Text(
                                  "[ALOS] 마스크팩 3입",
                                  style: TextStyle(
                                    height: 1,
                                    color: Color(0xff121212),
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${getTranslated('COLOR', context)} : 투명",
                                        style: TextStyle(
                                          height: 1,
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('|', context)}",
                                        style: TextStyle(
                                          height: 1,
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('AMOUNT', context)} : 1개",
                                        style: TextStyle(
                                          height: 1,
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${getTranslated('SELLING_PRICE', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "8,000원",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${getTranslated('DELIVERY_CHARGE', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "+ 2,500원",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  width: 300,
                                  child: const Divider(
                                    height: 1,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 20,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 6, 20, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${getTranslated('PAYMENT_AMOUNT', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "10,500원",
                                        style: TextStyle(
                                          color: Color(0xff0123B4),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "${getTranslated('DESTINATION', context)}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 21,
                          ),
                        ),
                      ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('ADDRESS', context)} ",
                              // essentialLabelText: " *",
                              hintText: "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Container(
                            width: 120,
                            // alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Text(""),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: CustomElevatedButton(onTap: () {}, buttonText: "${getTranslated('SEARCH', context)}",),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      CustomLabelTextField(
                        isTextable: false,
                        controller: _firstNameController,
                        // labelText: "",
                        // essentialLabelText: "",
                        hintText: "${getTranslated('SELECT_DISTINCT', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      CustomLabelTextField(
                        isTextable: false,
                        controller: _firstNameController,
                        // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('EMAIL', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_EMAIL', context)}",
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                        child: Text(
                          "${getTranslated('RECEIVED_CUSTOMER', context)}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
                          ),
                        ),
                      ),

                      CustomSmallRadioButton(
                        value: radioButton,
                        text: "${getTranslated('ALL_AGREE', context)}",
                        // reverse: true,
                      ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('DESTINATION', context)}",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('ADDRESS', context)} ",
                              // essentialLabelText: " *",
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

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        isTextable: false,
                        // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                      CustomElevatedButton(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductPaymentPage(),
                            ),
                          );
                        },
                        buttonText: "${getTranslated('GO_TO_PAY', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

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
