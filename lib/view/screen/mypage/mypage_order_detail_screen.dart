import 'package:flutter/material.dart';

import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/order_model.dart';
import '../../../localization/language_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';

class MyPageOrderDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final OrderModel orderModel;

  const MyPageOrderDetailPage(
      {Key key, this.isCreateScreen = true, this.orderModel})
      : super(key: key);

  @override
  State<MyPageOrderDetailPage> createState() => _MyPageOrderDetailPageState();
}

class _MyPageOrderDetailPageState extends State<MyPageOrderDetailPage>
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
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              slivers: [
                // App Bar
                CustomSliverAppBar(
                  "${getTranslated('ORDER_DETAIL_LIST', context)}",
                ),
                SliverToBoxAdapter(
                  child: Container(
                  color: Colors.white,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Color(0xffDDDDDD),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                          //fixme 주문번호 확인필요
                                          "${getTranslated('ORDER_NUMBER', context)}2022112492135423",
                                          style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('DELIVERY_COMPLETED', context)}",
                                          style: TextStyle(
                                              color: Color(0xff0123B4),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.orderModel.title}",
                                          style: TextStyle(
                                              color: Color(0xff000000),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          "${getTranslated('COLOR_', context)}${widget.orderModel.option}",
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('|', context)}",
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('AMOUNT_', context)}${widget.orderModel.quantity}${getTranslated('SOME', context)}",
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('|', context)}",
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${widget.orderModel.create_date}",
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                                    Row(
                                      children: [
                                        Text(
                                          "${widget.orderModel.price}${getTranslated('WON', context)}",
                                          style: TextStyle(
                                            color: Color(0xff0123B4),
                                            fontSize: 18,
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

                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xffDDDDDD),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30 , 20, 20),
                          child: Text(
                            "${getTranslated('ORDERED_CUSTOMER', context)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                          padding: const EdgeInsets.only(top: 0),
                          hintText: "${getTranslated('ETC_ADDRESS', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('EMAIL', context)} ",
                          // essentialLabelText: " *",
                   //       innerPadding: const EdgeInsets.only(top: 5),
                          hintText: "${getTranslated('HINT_EMAIL', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_Thirty_Five),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "${getTranslated('RECEIVED_CUSTOMER', context)}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                       CustomSmallRadioButton(
                         value: radioButton,
                         text: "${getTranslated('SAME_AS_ORDER', context)}",
                         //  fontSize: 15,
                         // reverse: true,
                       ),


                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('DESTINATION', context)} ",
                          // essentialLabelText: " *",
                          // hintText: "${getTranslated('HINT_NAME', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('NAME', context)} ",
                          // essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_NAME', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('PHONE', context)} ",
                          // essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_PHONE', context)}",
                        ),

                        // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

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

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        SizedBox(height: Dimensions.PADDING_SIZE_Thirty_Five),

                        FooterPage(),

                      ],
                    ),
                  ),
                )
              ],
            ),
            // Positioned(
            //   bottom: 0,
            //   child: FooterPage(),
            // ),
          ]),

        ));
  }
}
