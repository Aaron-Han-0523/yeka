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
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(0),
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

                        SizedBox(height: 18),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('ID', context)} ",
                          essentialLabelText: " *",
                          boxColor: Colors.black,
                          textColor:Colors.white,
                          hintText: "${getTranslated('HINT_ID', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('PW', context)} ",
                          essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_PW', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('CONFIRM_PW', context)} ",
                          essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('NAME', context)} ",
                          essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_NAME', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('PHONE', context)} ",
                          essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_PHONE', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextField(
                          controller: _firstNameController,
                          labelText: "${getTranslated('EMAIL', context)} ",
                          essentialLabelText: " *",
                          hintText: "${getTranslated('HINT_EMAIL', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                        Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_LARGE,
                              right: Dimensions.MARGIN_SIZE_LARGE),
                          // padding: const EdgeInsets.fromLTRB(2.0, 0, 16.0, 2.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${getTranslated('GENDER', context)} ",
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
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 2),

                              Row(
                                children: [
                                  CustomSmallRadioButton(
                                      value: radioButton,
                                      text: "${getTranslated('MALE', context)}",
                                      padding: const EdgeInsets.only(right: 0)
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

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        Row(
                          children: [
                            Expanded(
                              child: CustomLabelTextField(
                                controller: _firstNameController,
                                labelText: "${getTranslated('ADDRESS', context)} ",
                                essentialLabelText: " *",
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
                          labelText:
                          "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)} ",
                          // essentialLabelText: " *",
                          hintText:
                          "${getTranslated('HINT_COMPANY_REGISTRATION_NUMBER', context)}",
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        CustomLabelTextFieldUploadButton(
                            labelText:
                            "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}"
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        CustomElevatedButton(
                          onTap: () {},
                          buttonText: "${getTranslated('MODIFY_INFO', context)}",
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
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
          ]),
        ));
  }
}
