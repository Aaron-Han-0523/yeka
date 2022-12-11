import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';
import 'package:provider/provider.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import 'consultant_view.dart';

class ConsultantListScreen extends StatefulWidget {
  @override
  State<ConsultantListScreen> createState() => _ConsultantListScreenState();
}

class _ConsultantListScreenState extends State<ConsultantListScreen> {
  final ScrollController _scrollController = ScrollController();

  var sidoDropdownItems = ["a","B"];
  var dongDropdownItems = ["c","D"];


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
                CustomSliverAppBar("${getTranslated('CONSULTANT_LIST', context)}",).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        color: Color(0xffDDDDDD),
                        indent: 0,
                        endIndent: 0,
                      ),
                      Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              Dimensions.HOME_PAGE_PADDING,
                              20,
                              Dimensions.PADDING_SIZE_DEFAULT,
                              Dimensions.PADDING_SIZE_SMALL),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 6,
                                    child: Material(
                                      // elevation: 20.0,
                                      // shadowColor: Color(0XFF2434D7),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),

                                      child: Container(
                                        width: 170,
                                        child: CustomDropdownButton2(
                                          hint: '${getTranslated('SELECT_CITY', context)}',
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
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 6,
                                    child: Material(
                                      // elevation: 20.0,
                                      // shadowColor: Color(0XFF2434D7),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),

                                      child: Container(
                                        width: 170,
                                        child: CustomDropdownButton2(
                                          hint: '${getTranslated('SELECT_DISTINCT', context)}',
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ConsultantView(
                                  isHomePage: false,
                                  scrollController: _scrollController),

                              CustomElevatedButton(onTap: () {}, buttonText: "${getTranslated('LOOK_MORE', context)}"),
                              SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            ],
                          ),
                        ),
                      ),
                      FooterPage(),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
