import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_payment_screen.dart';

import '../../../data/model/response/order_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/order_provider.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';

class ProductShippingPage extends StatefulWidget {
  final bool isCreateScreen;
  final OrderModel orderModel;

  const ProductShippingPage(
      {Key key, this.isCreateScreen = true, this.orderModel})
      : super(key: key);

  @override
  State<ProductShippingPage> createState() => _ProductShippingPageState();
}

class _ProductShippingPageState extends State<ProductShippingPage>
    with TickerProviderStateMixin {
  TextEditingController _orderNameController = TextEditingController();
  TextEditingController _orderPhoneController = TextEditingController();
  TextEditingController _orderAddress1Controller = TextEditingController();
  TextEditingController _orderAddress2Controller = TextEditingController();
  TextEditingController _orderAddress3Controller = TextEditingController();
  TextEditingController _orderEmailController = TextEditingController();
  TextEditingController _receiveDestinationController = TextEditingController();
  TextEditingController _receiveNameController = TextEditingController();
  TextEditingController _receivePhoneController = TextEditingController();
  TextEditingController _receiveAddress1Controller = TextEditingController();
  TextEditingController _receiveAddress2Controller = TextEditingController();
  TextEditingController _receiveAddress3Controller = TextEditingController();

  bool radioButton = false;
  Map map;

  addOrder() async {
    String _orderName = _orderNameController.text.trim();
    String _orderPhone = _orderPhoneController.text.trim();
    String _orderAddress1 = _orderAddress1Controller.text.trim();
    String _orderAddress2 = _orderAddress2Controller.text.trim();
    String _orderAddress3 = _orderAddress3Controller.text.trim();
    String _orderEmail = _orderEmailController.text.trim();
    String _receiveDestination = _receiveDestinationController.text.trim();
    String _receiveName = _receiveNameController.text.trim();
    String _receivePhone = _receivePhoneController.text.trim();
    String _receiveAddress1 = _receiveAddress1Controller.text.trim();
    String _receiveAddress2 = _receiveAddress2Controller.text.trim();
    String _receiveAddress3 = _receiveAddress3Controller.text.trim();

    if (_orderName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('ORDER_NAME_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_orderPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('ORDER_PHONE_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_orderAddress1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "${getTranslated('ORDER_ADDRESS1_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_orderAddress2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "${getTranslated('ORDER_ADDRESS2_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_orderAddress3.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "${getTranslated('ORDER_ADDRESS3_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_orderEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('ORDER_EMAIL_FIELD_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receiveDestination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "${getTranslated('RECEIVE_DESTINATION_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receiveName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${getTranslated('RECEIVE_NAME_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receivePhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${getTranslated('RECEIVE_PHONE_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receiveAddress1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('RECEIVE_ADDRESS1_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receiveAddress2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('RECEIVE_ADDRESS2_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else if (_receiveAddress3.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("${getTranslated('RECEIVE_ADDRESS3_IS_REQUIRED', context)}"),
        backgroundColor: Colors.red,
      ));
    } else {
      widget.orderModel.orderer_name = _orderName;
      widget.orderModel.orderer_phone = _orderPhone;
      widget.orderModel.orderer_address1 = _orderAddress1;
      widget.orderModel.orderer_address2 = _orderAddress2;
      widget.orderModel.orderer_address3 = _orderAddress3;
      widget.orderModel.orderer_email = _orderEmail;
      widget.orderModel.recipient_place = _receiveDestination;
      widget.orderModel.recipient_name = _receiveName;
      widget.orderModel.recipient_phone = _receivePhone;
      widget.orderModel.recipient_address1 = _receiveAddress1;
      widget.orderModel.recipient_address2 = _receiveAddress2;
      widget.orderModel.recipient_address3 = _receiveAddress3;

      await Provider.of<OrderProvider>(context, listen: false)
          .addOrder(widget.orderModel);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductPaymentPage(
            orderModel: widget.orderModel,
          ),
        ),
      );
    }
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    map = Provider.of<AuthProvider>(context, listen: false).getUser();

    _orderNameController.text = map["name"];
    _orderPhoneController.text = map["phone"];
    _orderAddress1Controller.text = map["address1"];
    _orderAddress2Controller.text = map["address2"];
    _orderAddress3Controller.text = map["address3"];
    _orderEmailController.text = map["email"];
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await _loadData(context, true);
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
              ),

              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
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
                              ),
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
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: Image.network(
                                // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw1K7pE-hHoHeCSxqZh0S_X5sRm0IQ-yG25w&usqp=CAU",
                                "${widget.orderModel.image1 ?? ""}",
                                fit: BoxFit.fill,
                                height: 107,
                                width: 107,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.orderModel.title ?? ""}",
                                  style: TextStyle(
                                    height: 1,
                                    color: Color(0xff121212),
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${widget.orderModel.option ?? "" != null ? widget.orderModel.option ?? "" + " | " : ""}${getTranslated('AMOUNT', context)}${getTranslated(':', context)} ${PriceConverter.convertPrice(context, widget.orderModel.quantity.toDouble() ?? "")}${getTranslated('SOME', context)}",
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        "${PriceConverter.convertPrice(context, widget.orderModel.price.toDouble() ?? "")}${getTranslated('WON', context)}",
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        "${getTranslated('+', context)} ${PriceConverter.convertPrice(context, widget.orderModel.delivery_fee.toDouble() ?? "")}${getTranslated('WON', context)}",
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 6, 20, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                        "${PriceConverter.convertPrice(context, widget.orderModel.total_fee.toDouble() ?? "")}${getTranslated('WON', context)}",
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
                          "${getTranslated('ORDERED_CUSTOMER', context)}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 21,
                          ),
                        ),
                      ),
                      CustomLabelTextField(
                        controller: _orderNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      CustomLabelTextField(
                        controller: _orderPhoneController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _orderAddress1Controller,
                              labelText:
                                  "${getTranslated('ADDRESS', context)} ",
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Container(
                            width: 120,
                            // alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Text(""),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => KpostalView(
                                            useLocalServer: true,
                                            localPort: 1024,
                                            // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                            callback: (Kpostal result) {
                                              setState(() {
                                                _orderAddress1Controller.text =
                                                    result.postCode;
                                                _orderAddress2Controller.text =
                                                    result.address;
                                                // this.latitude = result.latitude.toString();
                                                // this.longitude = result.longitude.toString();
                                                // this.kakaoLatitude =
                                                //     result.kakaoLatitude.toString();
                                                // this.kakaoLongitude =
                                                //     result.kakaoLongitude.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    buttonText:
                                        "${getTranslated('SEARCH', context)}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      CustomLabelTextField(
                        isTextable: false,
                        controller: _orderAddress2Controller,
                        // labelText: "",
                        // essentialLabelText: "",
                        hintText:
                            "${getTranslated('SELECT_DISTINCT', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      CustomLabelTextField(
                        isTextable: false,
                        controller: _orderAddress3Controller,
                        // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      CustomLabelTextField(
                        controller: _orderEmailController,
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
                      InkWell(
                        onTap: () {
                          _receiveNameController.text =
                              _orderNameController.text;
                          _receivePhoneController.text =
                              _orderPhoneController.text;
                          _receiveAddress1Controller.text =
                              _orderAddress1Controller.text;
                          _receiveAddress2Controller.text =
                              _orderAddress2Controller.text;
                          _receiveAddress3Controller.text =
                              _orderAddress3Controller.text;

                          setState(() {
                            radioButton = !radioButton;
                          });
                        },
                        child: CustomSmallRadioButton(
                          value: radioButton,
                          text: "${getTranslated('SAME_AS_ORDER', context)}",
                          // reverse: true,
                        ),
                      ),
                      CustomLabelTextField(
                        controller: _receiveDestinationController,
                        labelText: "${getTranslated('DESTINATION', context)}",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      CustomLabelTextField(
                        controller: _receiveNameController,
                        labelText: "${getTranslated('NAME', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      CustomLabelTextField(
                        controller: _receivePhoneController,
                        labelText: "${getTranslated('PHONE', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_PHONE', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Row(
                        children: [
                          Expanded(
                            child: CustomLabelTextField(
                              controller: _receiveAddress1Controller,
                              labelText:
                                  "${getTranslated('ADDRESS', context)} ",
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('SELECT_CITY', context)}",
                            ),
                          ),
                          Container(
                            width: 120,
                            // alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Text(""),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => KpostalView(
                                            useLocalServer: true,
                                            localPort: 1024,
                                            // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                            callback: (Kpostal result) {
                                              setState(() {
                                                _receiveAddress1Controller
                                                    .text = result.postCode;
                                                _receiveAddress2Controller
                                                    .text = result.address;
                                                // this.latitude = result.latitude.toString();
                                                // this.longitude = result.longitude.toString();
                                                // this.kakaoLatitude =
                                                //     result.kakaoLatitude.toString();
                                                // this.kakaoLongitude =
                                                //     result.kakaoLongitude.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    buttonText:
                                        "${getTranslated('SEARCH', context)}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      CustomLabelTextField(
                        isTextable: false,
                        controller: _receiveAddress2Controller,
                        // labelText: "",
                        // essentialLabelText: "",
                        hintText:
                            "${getTranslated('SELECT_DISTINCT', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      CustomLabelTextField(
                        isTextable: false,
                        controller: _receiveAddress3Controller,
                        // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      CustomElevatedButton(
                        onTap: () async {
                          addOrder();
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
