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
                  "날짜 선택",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
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
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                // elevation: 20.0,
                                // shadowColor: Color(0XFF2434D7),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),

                                child: Column(
                                  children: [
                                    Text(
                                      "계절",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                      ),
                                    ),
                                    CustomDropdownButton2(
                                      dropdownWidth: 300,
                                      buttonWidth: 300,
                                      hint:
                                      '${getTranslated('SELECT_CATEGORY', context)}',
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
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                // elevation: 20.0,
                                // shadowColor: Color(0XFF2434D7),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),

                                child: Column(
                                  children: [
                                    Text(
                                      "분류(동양식, 서양식)",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                      ),
                                    ),
                                    CustomDropdownButton2(
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "세부분류(비비드, 페일, 라이트 등)",
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                            ),
                          ),
                          CustomDropdownButton2(
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
                          ),
                        ],
                      ),

                      CustomTextarea(
                        labelText: "상담내용 작성",
                        enabled: false,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("웜"),
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
                            Text("쿨"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("청"),
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
                            Text("탁"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("고대비"),
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
                            Text("저대비"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("고명도"),
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
                            Text("저명도"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("광택"),
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
                            Text("무광"),
                          ],
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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
