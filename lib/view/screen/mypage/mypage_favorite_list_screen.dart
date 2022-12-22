import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/provider/auth_provider.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/product_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'mypage_favorite_view.dart';

class MyPageFavoriteListScreen extends StatefulWidget {
  @override
  State<MyPageFavoriteListScreen> createState() => _MyPageFavoriteListScreenState();
}

class _MyPageFavoriteListScreenState extends State<MyPageFavoriteListScreen> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    int user_id = Provider.of<AuthProvider>(context, listen: false).getUser()["id"];
    Provider.of<ProductProvider>(context, listen: false)
        .getLatestProductMyFavoriteList(0, user_id, context, reload: reload);
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
                  "${getTranslated('LIKE_LIST', context)}",
                ),
                SliverToBoxAdapter(
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
                        padding: EdgeInsets.fromLTRB(
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.HOME_PAGE_PADDING,
                            Dimensions.PADDING_SIZE_LARGE),
                        color: Colors.white,
                        child: Column(
                          children: [

                            MyPageFavoriteView(
                                isHomePage: false,
                                scrollController: _scrollController),
                            CustomElevatedButton(
                                onTap: () {}, buttonText: "${getTranslated('LOOK_MORE', context)}", padding: EdgeInsets.symmetric(horizontal: 4)),
                            SizedBox(
                                height: Dimensions.PADDING_SIZE_LARGE),
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
