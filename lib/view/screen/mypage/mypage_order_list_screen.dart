import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/order_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'mypage_order_view.dart';

class MyPageOrderListScreen extends StatefulWidget {
  @override
  State<MyPageOrderListScreen> createState() => _MyPageOrderListScreenState();
}

class _MyPageOrderListScreenState extends State<MyPageOrderListScreen> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    int user_id = Provider.of<AuthProvider>(context, listen: false).getUser()["id"];

    Provider.of<OrderProvider>(context, listen: false)
        .getLatestOrderList(0, user_id, context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadData(context, true);
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
                  "주문 내역",isMyPageHidden: true,
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
                          Dimensions.PADDING_SIZE_LARGE,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            MyPageOrderView(
                                isHomePage: false,
                                scrollController: _scrollController),
                            CustomElevatedButton(
                                onTap: () {},
                                buttonText:
                                    "${getTranslated('LOOK_MORE', context)}",
                                padding: EdgeInsets.symmetric(horizontal: 4)),
                            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
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
