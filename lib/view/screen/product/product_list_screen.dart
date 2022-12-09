import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';
import 'package:provider/provider.dart';

import 'package:yeka/provider/review_provider.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_view.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();

  var sidoDropdownItems = ["a", "B"];
  var dongDropdownItems = ["c", "D"];

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<ReviewProvider>(context, listen: false)
        .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
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
                  "${getTranslated('BEAUTY_PRODUCT', context)}",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffdddddd),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          Dimensions.HOME_PAGE_PADDING,
                          Dimensions.PADDING_SIZE_SMALL,
                          Dimensions.PADDING_SIZE_DEFAULT,
                          Dimensions.PADDING_SIZE_SMALL,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Material(
                                      // elevation: 20.0,
                                      // shadowColor: Color(0XFF2434D7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8.0)),

                                      child: CustomDropdownButton2(
                                        dropdownWidth: 220,
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
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4.0,0.0,4.0,0.0,),
                                    child: Material(
                                      // elevation: 20.0,
                                      // shadowColor: Color(0XFF2434D7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8.0)),

                                      child: CustomDropdownButton2(
                                        hint:
                                            '${getTranslated('SELECT_ORDER', context)}',
                                        icon:
                                            const Icon(Icons.keyboard_arrow_down),
                                        iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                        dropdownItems: dongDropdownItems,
                                        dropdownWidth: 100,
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
                            ProductView(
                                isHomePage: false,
                                scrollController: _scrollController),
                            CustomElevatedButton(
                                onTap: () {}, buttonText: "${getTranslated('LOOK_MORE', context)}"),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                          ],
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
