import 'package:flutter/material.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/consultant/consultant_my_reserve_screen.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../util//color_resources.dart';
import '../../../util//dimensions.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';

class ConsultantReserveScreen extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;
  final MenuModel menuModel;
  final ConsultingModel consultingModel;

  const ConsultantReserveScreen({
    Key key,
    this.isCreateScreen = true, this.userModel, this.menuModel, this.consultingModel,
  }) : super(key: key);

  @override
  State<ConsultantReserveScreen> createState() =>
      _ConsultantReserveScreenState();
}

class _ConsultantReserveScreenState extends State<ConsultantReserveScreen>
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
              "${getTranslated('CONSULTING_RESERVE', context)}",
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
                      height: 1,
                      color: Color(0xffDDDDDD),
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Column(
                          children: [
                            Divider(
                              height: 1,
                              color: Color(0xffDDDDDD),
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 24, 0, 10),
                                  child: Text(
                                    "${getTranslated('CONSULTATION_INFO', context)}",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 18,
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
                              padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
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
                                    "${DateConverter.isoStringToDateOnly(widget.consultingModel.reservation_date)}",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
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
                                    "${widget.menuModel.menu_title}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${getTranslated('RESERVATION_AMOUNT', context)}",
                                    style: TextStyle(
                                      color: Color(0xffbbbbbb),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "${PriceConverter.convertPrice(context, widget.menuModel.menu_amount / 10)}${getTranslated('WON', context)}",
                                    style: TextStyle(
                                      color: Color(0xff0123B4),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                              child: Row(
                                children: [
                                  Text(
                                    "${getTranslated('DISCOUNT_10%', context)}",
                                    style: TextStyle(
                                      color: Color(0xff0123b4),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                              child: Row(
                                children: [
                                  Text(
                                    "${getTranslated('PAYMENT_INFO', context)}",
                                    style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
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
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
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
                                    "${widget.userModel.bank1} ${widget.userModel.bank2}",
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
                              padding: const EdgeInsets.fromLTRB(20, 11, 20, 10),
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
                                    "${widget.userModel.bank3}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                              padding: EdgeInsets.fromLTRB(65, 8, 65, 8),
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
                            SizedBox(height: 25),
                            CustomElevatedButton(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ConsultantMyReserveScreen(userModel: widget.userModel, menuModel: widget.menuModel, consultingModel: widget.consultingModel,),
                                      ),
                                  );
                                },
                                buttonText: "${getTranslated('CONFIRMATION', context)}",),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        )),
                    FooterPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
