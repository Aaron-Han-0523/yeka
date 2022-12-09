import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/textarea/custom_textarea.dart';
import '../aitest/ai_result_screen.dart';
import '../consultant/consultant_my_reserve_screen.dart';
import '../consultant/consultant_result_screen.dart';
import 'mypage_client_list_screen.dart';
import 'mypage_favorite_list_screen.dart';
import 'mypage_notice_board_list_screen.dart';
import 'mypage_order_screen.dart';
import 'mypage_update_screen.dart';

class MyPageConsultantResultWriteScreen extends StatefulWidget {
  @override
  State<MyPageConsultantResultWriteScreen> createState() => _MyPageConsultantResultWriteScreenState();
}

class _MyPageConsultantResultWriteScreenState extends State<MyPageConsultantResultWriteScreen> {
  final ScrollController _scrollController = ScrollController();
  var sidoDropdownItems = ["a", "B"];
  var dongDropdownItems = ["c", "D"];
  double _currentSliderValue = 20;

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
                  "컨설팅 상담결과 작성",
                ).getAppbar(),
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
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    // borderRadius:
                                    // BorderRadius.all(Radius.circular(8.0)),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "계절",
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        CustomDropdownButton2(
                                          dropdownWidth: 157,
                                          buttonWidth: 157,
                                          buttonPadding: const EdgeInsets.only(left: 10, right: 5),
                                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                          hint:
                                          '계절을 선택해주세요',
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                          iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                          dropdownItems: sidoDropdownItems,
                                          // value: receiveTimeStart,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   receiveTimeStart = value + "";
                                            // });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                              ),

                              Flexible(
                                child: Material(
                                    // elevation: 20.0,
                                    // shadowColor: Color(0XFF2434D7),
                                    // borderRadius:
                                    // BorderRadius.all(Radius.circular(8.0)),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "분류",
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        CustomDropdownButton2(
                                          dropdownWidth: 157,
                                          buttonWidth: 157,
                                          buttonPadding: const EdgeInsets.only(left: 10, right: 5),
                                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                          hint:
                                          '분류를 선택해주세요',
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
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "세부분류",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              CustomDropdownButton2(
                                dropdownWidth: 500,
                                buttonWidth: 157,
                                buttonPadding: const EdgeInsets.only(left: 10, right: 5),
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                hint:
                                '세부분류를 선택해주세요',
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
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: CustomTextarea(
                            padding : const EdgeInsets.all(0),
                    //        labelPadding: const EdgeInsets.fromLTRB(0, 0 ,0 , 10),
                            labelText: "상담내용 작성",
                    //        labelFontSize: 12,
                    //        hintText: "상세 상담내용을 작성해주세요",
                    //        hintTextColor: Color(0xffdddddd),
                    //        contentPadding: const EdgeInsets.symmetric(vertical: 8),

                          ),
                        ),


                        Container(
                            padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("웜",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: Slider(
                                    value: _currentSliderValue,
                                    max: 100,
                                    divisions: 100,
                                    label: _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _currentSliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                                Text("쿨",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("청",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              Text("탁",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                                  Text("고대비",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333),
                                    ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              Text("저대비",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("고명도",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              Text("저명도",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("광택",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue.round().toString(),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              Text("무광",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
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
                            buttonText: "상담 완료",
                          ),
                        ),


                        SizedBox(
                          height: Dimensions.PADDING_SIZE_OVER_LARGE,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_Thirty_Five,
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_OVER_LARGE,
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
