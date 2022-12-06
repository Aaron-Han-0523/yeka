import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_order_screen.dart';

import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../home/home_screens.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class ProductPaymentPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ProductPaymentPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ProductPaymentPage> createState() => _ProductPaymentPageState();
}

class _ProductPaymentPageState extends State<ProductPaymentPage>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    // _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('REVIEW_WRITE', context)}",
              ).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  // decoration: BoxDecoration(
                  //   color: Color(0xffcfcbc3),
                  // ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Text(
                        "결제정보",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18,
                        ),
                      ),
                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "계좌번호",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "국민은행 0000-00-000000",
                            style: TextStyle(
                              color: Color(0xffff3d3d),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "예금주",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "임지은",
                            style: TextStyle(
                              color: Color(0xffff3d3d),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "결제금액",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "25,000원",
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "배송비",
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "+2,500원",
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "최종결제금액",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "22,500원",
                            style: TextStyle(
                              color: Color(0xffff3d3d),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                        child: Text(
                          "입금자명과 회원님의 이름이 일치해야 하니 주의해주세요 :) \n 입금이 확인되면 다음단계로 넘어갑니다.",
                          style: TextStyle(
                            color: Color(0xffbbbbbb),
                            fontSize: 12,
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      CustomElevatedButton(
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductOrderPage(),
                            ),
                          );
                        },
                        buttonText: "확인",
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
