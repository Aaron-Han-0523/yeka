import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_order_screen.dart';

import '../../../data/model/response/order_model.dart';
import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';

class ProductPaymentPage extends StatefulWidget {
  final bool isCreateScreen;
  final OrderModel orderModel;

  const ProductPaymentPage(
      {Key key, this.isCreateScreen = true, this.orderModel})
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
                "${getTranslated('PAYMENT_PRODUCT', context)}",
              ),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  // decoration: BoxDecoration(
                  //   color: Color(0xffcfcbc3),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        height: 2,
                        color: Color(0xffDDDDDD),
                        indent: 0,
                        endIndent: 0,
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Text(
                          "${getTranslated('PAYMENT_INFO', context)}",
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 3,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${getTranslated('GRADATION_INFO', context)}",
                              style: TextStyle(
                                color: Color(0xffbbbbbb),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "국민은행 0000-00-000000",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                              child: Text(
                                "${getTranslated('DISCOUNT_HOLDER', context)}",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              "${getTranslated('YEKA', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                              child: Text(
                                "${getTranslated('PAYMENT_AMOUNT', context)}",
                                style: TextStyle(
                                  color: Color(0xffbbbbbb),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              "8,000${getTranslated('WON', context)}",
                              style: TextStyle(
                                color: Color(0xff0123b4),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 53, 0),
                              child: Text(
                                "${getTranslated('DELIVERY_CHARGE', context)}",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              "+ 2,500${getTranslated('WON', context)}",
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(
                        height: 3,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0xffDDDDDD),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${getTranslated('FINAL_PAYMENT_AMOUNT', context)}",
                              style: TextStyle(
                                color: Color(0xffbbbbbb),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "10,500${getTranslated('WON', context)}",
                              style: TextStyle(
                                color: Color(0xffff3d3d),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                          height: 45,
                          width: double.infinity,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${getTranslated('DEPOSIT_WARNING', context)}",
                                  style: TextStyle(
                                    color: Color(0xff979797),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "${getTranslated('DEPOSIT_WARNING_NEXT', context)}",
                                  style: TextStyle(
                                    color: Color(0xff979797),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 272.5),
                        child: CustomElevatedButton(
                          onTap: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProductOrderPage(),
                              ),
                            );
                          },
                          buttonText: "${getTranslated('CONFIRMATION', context)}",
                        ),
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
