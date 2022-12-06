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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "날짜 선택",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xff999999),
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
                                  ),
                                ),
                                Text(
                                  "정하운",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "결제일",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "22.11.09",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 5,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "상담명",
                                  style: TextStyle(
                                    color: Color(0xffbbbbbb),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "톡으로 만나는 나만의 피부 진단 :)",
                                  style: TextStyle(
                                    color: Color(0xff0123b4),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Row(children: [
                        Text("출금가능액"),
                        Expanded(
                          child: CustomTextField(
                            // controller: _firstNameController,
                            // essentialLabelText: " *",
                            hintText:
                            "${getTranslated('HINT_NAME', context)}",
                          ),
                        ),
                      ],),

                      Row(children: [
                        Text("내 계좌"),
                        Expanded(child: CustomDropdownButton2(
                          hint:
                          '${getTranslated('SELECT_ORDER', context)}',
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
                            // controller: _firstNameController,
                            // essentialLabelText: " *",
                            hintText:
                            "${getTranslated('HINT_NAME', context)}",
                          ),
                        ),
                      ],),


                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black12,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Container(
                          width: 100,
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
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
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
