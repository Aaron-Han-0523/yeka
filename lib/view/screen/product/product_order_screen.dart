import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/order_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';

class ProductOrderPage extends StatefulWidget {
  final bool isCreateScreen;
  final OrderModel orderModel;

  const ProductOrderPage(
      {Key key, this.isCreateScreen = true, this.orderModel})
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
                "${getTranslated('ORDER_DETAIL_LIST', context)}",
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
                      Divider(
                        height: 2,
                        color: Color(0xffDDDDDD),
                        indent: 0,
                        endIndent: 0,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
                            child: Image.asset(
                              Images.online_shop,
                              fit: BoxFit.fill,
                              height: 22.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                            child: Text(
                              "${getTranslated('CHECK_YOUR_ORDER', context)}",
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
                              "${getTranslated('OTHER_PRODUCT', context)}",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 18),
                            child: Text(
                              "${getTranslated('MY_PAGE_ORDERED_LIST', context)}",
                              style: TextStyle(
                                color: Color(0xff0123B4),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 18),
                            child: Text(
                              "${getTranslated('CAN_CHECK', context)}",
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
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${getTranslated('ORDER_NUMBER', context)}:2022112492135423",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 9,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(60, 0, 20, 0),
                                        child: Text(
                                          "${getTranslated('PAYMENT_COMPLETED', context)}",
                                          style: TextStyle(
                                            color: Color(0xff7700FF),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Text(
                                      "[ALOS] 마스크팩 3입",
                                      style: TextStyle(
                                        color: Color(0xff000000),
                                        fontSize: 16,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${getTranslated('COLOR', context)} : 투명",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('|', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('AMOUNT', context)} : 1${getTranslated('SOME', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('|', context)}",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        "2022.11.21",
                                        style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "10,500${getTranslated('WON', context)}",
                                      style: TextStyle(
                                        color: Color(0xff0123B4),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                          "${getTranslated('ORDERED_CUSTOMER', context)}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 20,
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
                              labelText:
                                  "${getTranslated('ADDRESS', context)} ",
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

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

                      // CustomSmallRadioButton(
                      //   value: radioButton,
                      //   text: "주문자와 동일",
                      //   // reverse: true,
                      // ),

                      CustomLabelTextField(
                        controller: _firstNameController,
                        labelText: "${getTranslated('DESTINATION', context)} ",
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
