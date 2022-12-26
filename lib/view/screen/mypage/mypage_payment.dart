import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/consulting_model.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class MyPagePaymentScreen extends StatefulWidget {
  final ConsultingModel consultingModel;

  const MyPagePaymentScreen({Key key, this.consultingModel}) : super(key: key);


  @override
  State<MyPagePaymentScreen> createState() => _MyPagePaymentScreenState();
}

class _MyPagePaymentScreenState extends State<MyPagePaymentScreen> {
  final ScrollController _scrollController = ScrollController();
  var dongDropdownItems = ["c", "D"];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('SETTLEMENT_AMOUNT', context)}",
                ),
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
                          padding: const EdgeInsets.fromLTRB(20, 18, 20, 126),
                          color: Colors.white,
                          child: Column(
                            children: [

                              Container(
                                padding: EdgeInsets.fromLTRB(12, 10, 15, 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('NAME_CUSTOMER', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.client_name : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('PAYMENT_DAY', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.payment_amount : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('COUNSELING_NAME', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.consulting_title : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('PAYMENT_AMOUNT', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.payment_amount : ""}${getTranslated('WON', context)}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('STATUS_PAYMENT', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('RESERVATION_DEPOSIT_COMPLETED', context)}",
                                          style: TextStyle(
                                            color: Color(0xffFF9924),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('COMMISSION', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.commission : ""}${getTranslated('PERCENT', context)}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const Divider(
                                      height: 11,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: Color(0xffeeeeee),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('FINAL_AMOUNT', context)}",
                                          style: TextStyle(
                                            color: Color(0xffbbbbbb),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),

                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.final_amount : ""}${getTranslated('WON', context)}",
                                          style: TextStyle(
                                              color: Color(0xffFF0000),
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                              Container(
                                padding: EdgeInsets.fromLTRB(12, 10, 15, 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffEEEEEE),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('NAME_CUSTOMER', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.client_name : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('PAYMENT_DAY', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.payment_date : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('COUNSELING_NAME', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.consulting_title : ""}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('PAYMENT_AMOUNT', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.payment_amount : ""}${getTranslated('WON', context)}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('STATUS_PAYMENT', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${getTranslated('RESERVATION_DEPOSIT_COMPLETED', context)}",
                                          style: TextStyle(
                                              color: Color(0xff0123B4),
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('COMMISSION', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.commission : ""}${getTranslated('PERCENT', context)}",
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const Divider(
                                      height: 11,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                      color: Color(0xffeeeeee),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${getTranslated('FINAL_AMOUNT', context)}",
                                          style: TextStyle(
                                              color: Color(0xffbbbbbb),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),

                                        Text(
                                          "${widget.consultingModel != null ? widget.consultingModel.final_amount : ""}${getTranslated('WON', context)}",
                                          style: TextStyle(
                                              color: Color(0xffFF0000),
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "${getTranslated('WITH_DRAWABLE_AMOUNT', context)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),

                                    // controller: _firstNameController,
                                    // essentialLabelText: " *",
                                    // hintText: "${getTranslated('HINT_NAME', context)}",
                                  ),
                                ),
                              ],
                              ),

                              SizedBox(height: 13),

                              Row(children: [
                                Text("${getTranslated('MY_ACCOUNT', context)}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Expanded(child: CustomDropdownButton2(
                                  padding: const EdgeInsets.fromLTRB(20, 10, 7.5, 10),
                   //           borderRadius: 5,
                   //           borderColor: Color(0xffeeeeee),
                                  hint: '${getTranslated('SELECT_BANK', context)}',
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down),
                                  iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                  dropdownItems: dongDropdownItems,
                                  // value: "",
                                  onChanged: (value) {
                                    // setState(() {
                                    //   receiveTimeEnd = value + "";
                                    // });
                                  },
                                ),),
                                Expanded(
                                  child: CustomTextField(
                                    contentPadding: const EdgeInsets.fromLTRB(10, 7.5, 0, 7.5),
                                    // controller: _firstNameController,
                                    // essentialLabelText: " *",
                                    hintText:
                                    "${getTranslated('FILL_IN_ACCOUNT_NUMBER', context)}",
                                  ),
                                ),
                              ],),


                                Container(
                                  padding: EdgeInsets.only(top: 30),
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      // ClientsModel clientsModel = ClientsModel(
                                      //   phoneNum: phoneNumberTextEditingController.text,
                                      //   password: passwordTextEditingController.text,
                                      // );
                                      //
                                      // Provider.of<ClientsProvider>(context, listen: false)
                                      //     .login(clientsModel, route);
                                    },
                                    buttonText: "${getTranslated('APPLICATION_FOR_WITHDRAWAL', context)}",
                                    padding: EdgeInsets.symmetric(horizontal: 0),
                                  ),
                                ),
                              // ),
                            ],
                          ),
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
