import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../provider/banner_provider.dart';
import '../aitest/image_upload_screen.dart';
import '../auth/auth_screen.dart';
import '../community/community_home_screen.dart';
import '../consultant/consultant_list_screen.dart';
import '../mypage/mypage_home_screen.dart';
import '../product/product_list_screen.dart';
import 'widget/review_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<BannerProvider>(context, listen: false)
        .getBannerJson(reload, context);
    // Provider.of<ReviewProvider>(context, listen: false)
    //     .getLatestReviewList(0, context, reload: reload);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  Widget build(BuildContext context) {
    var titleList = [
      "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
      "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
      "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
      "제 피부톤에 어떤 화장품이 잘 어울릴까요?",
    ];
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).highlightColor,
                  leading: Container(),
                  title: Center(
                    child: Image.asset(
                      Images.logo_b,
                      height: 30,
                    ),
                  ),
                  actions: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyPageHomeScreen()))
                          },
                          child: Image.asset(
                            Images.login_id,
                            height: 17,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 12.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AuthScreen()))
                          },
                          child: Image.asset(
                            Images.mypage,
                            height: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ImageUploadPage()))
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: AssetImage(
                                Images.ai_test2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ConsultantListScreen()))
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                              image: AssetImage(
                                Images.consult,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Stack(
                          children: [
                            Center(
                              // width: 170,
                              child: Text(
                                "뷰티상품",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              // width: 170,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ProductListScreen(),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "VIEW MORE >",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 180,
                        endIndent: 180,
                        color: Colors.black12,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      ReviewWidget(
                        isHomePage: true,
                        scrollController: _scrollController,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Stack(
                          children: [
                            Center(
                              // width: 170,
                              child: Text(
                                "커뮤니티",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              // width: 170,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CommunityHomeScreen(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "VIEW MORE >",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 180,
                        endIndent: 180,
                        color: Colors.black12,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, position) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12.0, 12.0, 12.0, 6.0),
                                      child: Text(
                                        titleList[position],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        ">",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                position == titleList.length - 1
                                    ? const Divider(
                                        height: 3,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.black,
                                      )
                                    : Divider(
                                        height: 2.0,
                                        color: Colors.grey,
                                      ),
                              ],
                            );
                          },
                          itemCount: titleList.length,
                        ),
                      ),
                      FooterPage(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 ||
        oldDelegate.minExtent != 70 ||
        child != oldDelegate.child;
  }
}
