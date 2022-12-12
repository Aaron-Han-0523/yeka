import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_view.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class MyPageFavoriteListScreen extends StatefulWidget {
  @override
  State<MyPageFavoriteListScreen> createState() => _MyPageFavoriteListScreenState();
}

class _MyPageFavoriteListScreenState extends State<MyPageFavoriteListScreen> {
  final ScrollController _scrollController = ScrollController();

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
                  "찜 목록",
                ).getAppbar(),
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

                            ProductView(
                                isHomePage: false,
                                scrollController: _scrollController),
                            CustomElevatedButton(
                                onTap: () {}, buttonText: "더보기 ∨", padding: EdgeInsets.symmetric(horizontal: 4)),
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
