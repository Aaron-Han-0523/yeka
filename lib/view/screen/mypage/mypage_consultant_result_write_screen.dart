import 'package:flutter/material.dart';

import 'package:yeka/util/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/consulting_model.dart';
import '../../../localization/language_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/textarea/custom_textarea.dart';

class MyPageConsultantResultWriteScreen extends StatefulWidget {
  final ConsultingModel consultingModel;

  const MyPageConsultantResultWriteScreen({Key key, this.consultingModel})
      : super(key: key);

  @override
  State<MyPageConsultantResultWriteScreen> createState() =>
      _MyPageConsultantResultWriteScreenState();
}

class _MyPageConsultantResultWriteScreenState
    extends State<MyPageConsultantResultWriteScreen> {
  final ScrollController _scrollController = ScrollController();
  var sidoDropdownItems = ["a", "B"];
  var dongDropdownItems = ["c", "D"];

  double _currentSliderValue1 = 20;
  double _currentSliderValue2 = 20;
  double _currentSliderValue3 = 20;
  double _currentSliderValue4 = 20;
  double _currentSliderValue5 = 20;

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
                  "${getTranslated('FILL_IN_CONSULTING_RESULT', context)}",isMyPageHidden: true,
                ),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${getTranslated('SEASON', context)}",
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomDropdownButton2(
                                        dropdownWidth: 157,
                                        buttonWidth: 157,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 10, right: 5),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 7, 0, 0),
                                        hint:
                                            '${getTranslated('SELECT_SEASON', context)}',
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${getTranslated('CLASSIFICATION', context)}",
                                        style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomDropdownButton2(
                                        dropdownWidth: 157,
                                        buttonWidth: 157,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 10, right: 5),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 7, 0, 0),
                                        hint:
                                            '${getTranslated('SELECT_CLASSIFICATION', context)}',
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
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
                          padding: EdgeInsets.fromLTRB(
                            20.0,
                            0.0,
                            20.0,
                            0.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "${getTranslated('DETAILED_CATEGORIES', context)}",
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              CustomDropdownButton2(
                                // dropdownWidth: 500,
                                // buttonWidth: 157,
                                buttonPadding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                hint:
                                    '${getTranslated('SELECT_DETAILED_CATEGORIES', context)}',
                                icon: const Icon(Icons.keyboard_arrow_down),
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
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: CustomTextarea(
                            label_fontSize: 12,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                            labelText:
                                "${getTranslated('FILL_IN_CONTENT_CONSULTATION', context)}",
                            hintText:
                                "${getTranslated('FILL_IN_CONTENT_DETAIL_CONSULTATION', context)}",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${getTranslated('WARM', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue1,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue1.round().toString(),
                                  activeColor: Color(0xffdddddd),
                                  inactiveColor: Color(0xffdddddd),
                                  thumbColor: Color(0xfff8f8f8),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue1 = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "${getTranslated('COOL', context)}",
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
                              Text(
                                "${getTranslated('CLEAR', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue2,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue2.round().toString(),
                                  activeColor: Color(0xffdddddd),
                                  inactiveColor: Color(0xffdddddd),
                                  thumbColor: Color(0xfff8f8f8),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue2 = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "${getTranslated('CLOUDY', context)}",
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
                              Text(
                                "${getTranslated('HIGH_CONTRAST_IMAGE', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue3,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue3.round().toString(),
                                  activeColor: Color(0xffdddddd),
                                  inactiveColor: Color(0xffdddddd),
                                  thumbColor: Color(0xfff8f8f8),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue3 = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "${getTranslated('LOW_CONTRAST_IMAGE', context)}",
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
                              Text(
                                "${getTranslated('HIGH_BRIGHTNESS', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue4,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue4.round().toString(),
                                  activeColor: Color(0xffdddddd),
                                  inactiveColor: Color(0xffdddddd),
                                  thumbColor: Color(0xfff8f8f8),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue4 = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "${getTranslated('LOW_BRIGHTNESS', context)}",
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
                              Text(
                                "${getTranslated('GLOSS', context)}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Slider(
                                  value: _currentSliderValue5,
                                  max: 100,
                                  divisions: 100,
                                  label: _currentSliderValue5.round().toString(),
                                  activeColor: Color(0xffdddddd),
                                  inactiveColor: Color(0xffdddddd),
                                  thumbColor: Color(0xfff8f8f8),
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentSliderValue5 = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "${getTranslated('MATT', context)}",
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
                            buttonText:
                                "${getTranslated('COMPLETE_CONSULTATION', context)}",
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                        SizedBox(height: Dimensions.PADDING_SIZE_Thirty_Five),
                        FooterPage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Positioned(
            //   bottom: 0,
            //   child: FooterPage(),
            // ),
          ],
        ),
      ),
    );
  }
}
