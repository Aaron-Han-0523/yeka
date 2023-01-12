import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_view.dart';

import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/product_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();

  List<String> categoryDropdownItems = [];
  List<String> sortDropdownItems = [];
  int categoryDropdownValue = 0;
  int sortDropdownValue = 0;

  Future<void> _loadData(BuildContext context, bool reload) async {
    int user_id = Provider.of<AuthProvider>(context, listen: false).getUser()["id"];

    await Provider.of<ProductProvider>(context, listen: false)
        .getLatestProductList(0, user_id, context, reload: reload);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    List<String> categoryDropdownItems = [];
    List<String> sortDropdownItems = [];

    categoryDropdownItems
        .add("${getTranslated('CATEGORY_DROPDOWN_ITEMS_TOP', context)}");
    categoryDropdownItems.add(
    "${getTranslated('CATEGORY_DROPDOWN_ITEMS_BOTTOMS', context)}");
    categoryDropdownItems.add(
    "${getTranslated('CATEGORY_DROPDOWN_ITEMS_SHOES', context)}");
    categoryDropdownItems.add(
    "${getTranslated('CATEGORY_DROPDOWN_ITEMS_COSMETICS', context)}");
    sortDropdownItems.add(
    "${getTranslated('SORT_DROPDOWN_ITEMS_POPULARITY_ORDER', context)}");
    sortDropdownItems.add(
    "${getTranslated('SORT_DROPDOWN_ITEMS_NEW_PRODUCT_ORDER', context)}");

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('BEAUTY_PRODUCT', context)}",
                ),
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
/*
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
                                        dropdownItems: categoryDropdownItems,
                                        value: categoryDropdownItems[categoryDropdownValue],
                                        onChanged: (value) {
                                          setState(() {
                                            categoryDropdownValue = categoryDropdownItems.indexOf(value);
                                          });
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
                                        dropdownItems: sortDropdownItems,
                                        dropdownWidth: 100,
                                        value: sortDropdownItems[sortDropdownValue],
                                        onChanged: (value) {
                                          setState(() {
                                            sortDropdownValue = sortDropdownItems.indexOf(value);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
*/
                            ProductView(
                                isHomePage: false,
                                scrollController: _scrollController,
                            ),
                            // CustomElevatedButton(
                            //     onTap: () {}, buttonText: "${getTranslated('LOOK_MORE', context)}"),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                            ),
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
