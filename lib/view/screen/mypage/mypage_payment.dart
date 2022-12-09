import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class MyPagePaymentScreen extends StatefulWidget {
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
                  "정산 금액",
                ).getAppbar(),
                SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 126),
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
                                      "고객명",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "정하운",
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
                                      "결제일",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "22.11.09",
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
                                      "상담명",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "톡으로 만나는 나만의 피부 진단 :)",
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
                                      "결제금액",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "300,000원",
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
                                      "결제상태",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "예약금입금완료",
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
                                      "수수료",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "20%",
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
                                      "최종금액",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    Text(
                                      "240,000원",
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
                                      "고객명",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "정하운",
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
                                      "결제일",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "22.11.09",
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
                                      "상담명",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "톡으로 만나는 나만의 피부 진단 :)",
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
                                      "결제금액",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "300,000원",
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
                                      "결제상태",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "예약금입금완료",
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
                                      "수수료",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "20%",
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
                                      "최종금액",
                                      style: TextStyle(
                                          color: Color(0xffbbbbbb),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    Text(
                                      "240,000원",
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
                                "출금가능액",
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
                            Text("내 계좌",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Expanded(child: CustomDropdownButton2(
                              padding: const EdgeInsets.fromLTRB(20, 10, 7.5, 10),
                              borderRadius: 5,
                              borderColor: Color(0xffeeeeee),
                              hint: '은행선택',
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
                                "계좌번호를 입력해주세요",
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
                                buttonText: "출금 신청",
                              ),
                            ),
                          // ),
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
