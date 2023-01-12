import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constants.dart';
import '../../../provider/user_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import 'consultant_view.dart';

class ConsultantListScreen extends StatefulWidget {
  @override
  State<ConsultantListScreen> createState() => _ConsultantListScreenState();
}

class _ConsultantListScreenState extends State<ConsultantListScreen> {
  final ScrollController _scrollController = ScrollController();

  var areaCodeJson = AppConstants.AREA_CODE;

  var sidoCodeArr = AppConstants.CITY_CODE;

  List<String> sidoDropdownItems = [];
  List<String> dongDropdownItems = [];
  String sidoDropdownValue = null;
  String dongDropdownValue = null;

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<UserProvider>(context, listen: false)
        .getLatestConsultantList(0, context, reload: reload);
  }

  Future<void> _loadDataWithAddress(
      BuildContext context, bool reload, String sido, String dong) async {
    for (var i = 0; i < areaCodeJson.length; i++) {
      areaCodeJson[i].keys.forEach((key) {
        if (key == sido) {
          sido = sidoCodeArr[i];
        }
      });
    }

    Provider.of<UserProvider>(context, listen: false)
        .getLatestConsultantListWithAddress(0, sido ?? "", dong ?? "", context,
            reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  void changeDong(sido) {
    dongDropdownItems = [];

    for (var i = 0; i < areaCodeJson.length; i++) {
      areaCodeJson[i].keys.forEach((key) {
        if (key == sido) {
          print(areaCodeJson[i][key]);
          areaCodeJson[i][key].forEach((key) {
            dongDropdownItems.add(key);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    sidoDropdownItems = [];

    for (var i = 0; i < areaCodeJson.length; i++) {
      areaCodeJson[i].keys.forEach((key) {
        sidoDropdownItems.add(key);
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('CONSULTANT_LIST', context)}",
                ),
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
                            Dimensions.PADDING_SIZE_SMALL,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 6,
                                    child: Material(
                                      // elevation: 20.0,
                                      // shadowColor: Color(0XFF2434D7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),

                                      child: Container(
                                        width: 170,
                                        child: CustomDropdownButton2(
                                          hint:
                                              '${getTranslated('SELECT_CITY', context)}',
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          iconSize:
                                              Dimensions.ICON_SIZE_DEFAULT,
                                          dropdownItems: sidoDropdownItems,
                                          value: sidoDropdownValue,
                                          onChanged: (value) {
                                            changeDong(value);

                                            setState(() {
                                              dongDropdownValue = null;
                                              sidoDropdownValue = value;
                                            });

                                            _loadDataWithAddress(
                                              context,
                                              true,
                                              sidoDropdownValue,
                                              dongDropdownValue,
                                            );
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),

                                      child: Container(
                                        width: 170,
                                        child: CustomDropdownButton2(
                                          hint:
                                              '${getTranslated('SELECT_DISTINCT', context)}',
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          iconSize:
                                              Dimensions.ICON_SIZE_DEFAULT,
                                          dropdownItems: dongDropdownItems,
                                          value: dongDropdownValue,
                                          onChanged: (value) {
                                            setState(() {
                                              dongDropdownValue = value;
                                            });

                                            _loadDataWithAddress(
                                                context,
                                                true,
                                                sidoDropdownValue,
                                                dongDropdownValue);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ConsultantView(
                                isHomePage: false,
                                scrollController: _scrollController,
                                sido: sidoDropdownValue,
                                dong: dongDropdownValue,
                              ),
/*
                              CustomElevatedButton(
                                  onTap: () {},
                                  buttonText:
                                      "${getTranslated('LOOK_MORE', context)}"),
*/
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
