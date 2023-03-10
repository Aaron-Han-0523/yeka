import 'package:flutter/material.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/personal_color_model.dart';
import '../../../localization/language_constants.dart';
import '../../../util//color_resources.dart';
import '../../../util//dimensions.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';
import 'consultant_result_screen.dart';

class ConsultantPaymentScreen extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;
  final MenuModel menuModel;
  final ConsultingModel consultingModel;
  final PersonalColorModel personalColorModel;

  const ConsultantPaymentScreen({
    Key key,
    this.isCreateScreen = true,
    this.userModel,
    this.consultingModel,
    this.menuModel,
    this.personalColorModel,
  }) : super(key: key);

  @override
  State<ConsultantPaymentScreen> createState() =>
      _ConsultantPaymentScreenState();
}

class _ConsultantPaymentScreenState extends State<ConsultantPaymentScreen>
    with TickerProviderStateMixin {
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
              "${getTranslated('PAY_CONSULTING', context)}",
            ),

            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.bottomCenter,
                // width: MediaQuery.of(context).size.width + 100,
                decoration: BoxDecoration(color: Colors.white),
                // constraints: BoxConstraints(
                //     minHeight: MediaQuery.of(context).size.height * 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 2,
                      color: Color(0xff666666),
                      indent: 0,
                      endIndent: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 17, 0, 15),
                      child: Text(
                        "${getTranslated('MY_CONSULTATION', context)}",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('COUNSELING', context)}",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${DateConverter.isoStringToDateOnly(widget.consultingModel.reservation_date)}" ??
                                "",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('COUNSELING_NAME', context)}",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${widget.consultingModel.consulting_title}" ?? "",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('PAYMENT_INFO', context)}",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${PriceConverter.convertPrice(context, widget.consultingModel.payment_amount.toDouble())} ${getTranslated('WON', context)}" ??
                                "",
                            style: TextStyle(
                              color: Color(0xff0123b4),
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(255, 0, 0, 10),
                          child: Text(
                            "${getTranslated('RESERVATION_AMOUNT', context)}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 7.5),
                          child: Text(
                            "${getTranslated('MINUS', context)}${PriceConverter.convertPrice(context, widget.consultingModel.reservation_amount.toDouble())}${getTranslated('WON', context)}" ??
                                "",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 3,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xffDDDDDD),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5.5, 20, 13),
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
                            "${PriceConverter.convertPrice(context, widget.consultingModel.final_amount.toDouble())}${getTranslated('WON', context)}" ??
                                "",
                            style: TextStyle(
                              color: Color(0xffff3d3d),
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 23),
                      child: Text(
                        "${getTranslated('FINAL_PAYMENT_DEDUCTED_AMOUNT', context)}",
                        style: TextStyle(
                          color: Color(0xff0123b4),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    // Container(
                    //   child: Text(
                    //     "????????? ????????? ?????? ????????? ?????? \"???????????? \" ????????? ???????????????.",
                    //     style: TextStyle(
                    //       color: Color(0xffbbbbbb),
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 7.75),
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
                      padding: const EdgeInsets.fromLTRB(20, 15.225, 20, 11),
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
                            "${widget.userModel.bank1} ${widget.userModel.bank2}" ??
                                "",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getTranslated('DISCOUNT_HOLDER', context)}",
                            style: TextStyle(
                              color: Color(0xffbbbbbb),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "${widget.userModel.bank3}" ?? "",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                        padding: EdgeInsets.fromLTRB(65, 8, 65, 15),
                        child: Column(
                          children: [
                            Text(
                              "${getTranslated('DEPOSIT_WARNING', context)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff979797),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "${getTranslated('DEPOSIT_WARNING_NEXT', context)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff979797),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    CustomElevatedButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ConsultantResultScreen(
                                userModel: widget.userModel,
                                consultingModel: widget.consultingModel,
                              ),
                            ),
                          );
                        },
                        buttonText:
                            "${getTranslated('CONFIRMATION', context)}"),
                    SizedBox(height: 150),
                    // FooterPage(),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FooterPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
