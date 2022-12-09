import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_label_textfield_upload_button.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';

class MyPageUpdateScreen extends StatefulWidget {
  @override
  State<MyPageUpdateScreen> createState() =>
      _MyPageUpdateScreenState();
}

class _MyPageUpdateScreenState
    extends State<MyPageUpdateScreen> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController _firstNameController = TextEditingController();
  bool radioButton = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "개인정보 수정",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Column(
                          children: [
                            SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('ID', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              boxColor: Colors.black,
                              textColor:Colors.white,
                              hintText: "${getTranslated('HINT_ID', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('PW', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText: "${getTranslated('HINT_PW', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('CONFIRM_PW', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('NAME', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText: "${getTranslated('HINT_NAME', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('PHONE', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText: "${getTranslated('HINT_PHONE', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText: "${getTranslated('EMAIL', context)} ",
                              essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText: "${getTranslated('HINT_EMAIL', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.MARGIN_SIZE_DEFAULT,
                                  right: Dimensions.MARGIN_SIZE_DEFAULT),
                              padding: const EdgeInsets.fromLTRB(2.0, 0, 16.0, 2.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "성별 ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                        Text(
                                        " *",
                                        style: TextStyle(
                                          color: Color(0xffff0000),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7),
                                  Row(
                                    children: [
                                      CustomSmallRadioButton(
                                          value: radioButton,
                                          text: "${getTranslated('MALE', context)}",
                                          padding: const EdgeInsets.only(right: 27)
                                      ),
                                      CustomSmallRadioButton(
                                          value: radioButton,
                                          text: "${getTranslated('FEMALE', context)}"
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomLabelTextField(
                                    controller: _firstNameController,
                                    labelText: "${getTranslated('ADDRESS', context)} ",
                                    essentialLabelText: " *",
                                    innerPadding: const EdgeInsets.only(top: 5),
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
                                      innerPadding: const EdgeInsets.only(top: 5),
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
                               outerPadding: const EdgeInsets.only(top: 0),
                               innerPadding: const EdgeInsets.only(top: 5),
                               hintText: "${getTranslated('ETC_ADDRESS', context)}",
                              ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextField(
                              controller: _firstNameController,
                              labelText:
                              "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)} ",
                              // essentialLabelText: " *",
                              innerPadding: const EdgeInsets.only(top: 5),
                              hintText:
                              "${getTranslated('HINT_COMPANY_REGISTRATION_NUMBER', context)}",
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            CustomLabelTextFieldUploadButton(
                                labelText:
                                "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}"),

                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                            CustomElevatedButton(
                              onTap: () {},
                              buttonText: "정보 수정하기",
                              padding: const EdgeInsets.symmetric(horizontal: 15),)
                          ],
                        ),
                      SizedBox(height: 123),

                      ],
                    ),

                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: FooterPage(),
            ),
          ]),
        ));
  }
}
