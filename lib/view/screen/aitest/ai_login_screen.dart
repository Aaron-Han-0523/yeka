import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/basewidget/textfield/custom_car_number_textfield.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';

class AILoginPage extends StatefulWidget {
  final int season;
  final int detailSeasonType;

  AILoginPage({
    this.season,
    this.detailSeasonType,
  });

  @override
  State<AILoginPage> createState() => _AILoginPageState();
}

class _AILoginPageState extends State<AILoginPage>
    with TickerProviderStateMixin {
  bool _radioValue = true;
  bool _inputFormValue = false;
  TextEditingController _textEditingController = TextEditingController();

  void setStateButtonValue(value) {
    setState(() {
      _inputFormValue = value;
    });
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
              CustomSliverAppBar("내 차량번호 입력"),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black12,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.fromLTRB(
                          16.0,
                          16.0,
                          16.0,
                          0.0,
                        ),
                        padding: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.black12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "폐차 견적을 위해",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff212121),
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "조회하실 차량 정보",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff212121),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "를 입력해주세요.",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff212121),
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCarNumberTextField(
                                _textEditingController,
                                function: setStateButtonValue,
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 4.0, 0.0, 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Color(0XFF2434D7),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _radioValue = !_radioValue;
                                  });
                                },
                                child: CustomRadioButton(
                                  _radioValue,
                                  "개인정보 수집 동의",
                                  Color(0XFF2434D7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _radioValue && _inputFormValue
                            ? CustomElevatedButton(
                                onTap: () async {},
                                buttonText: '내 차 정보 보기',
                              )
                            : CustomElevatedButton(
                                onTap: () {},
                                buttonText: '내 차 정보 보기',
                                backgroundColor: Colors.grey,
                              ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
