import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/consulting_model.dart';

import 'package:yeka/util/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../../basewidget/product_shimmer.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class MyPagePaymentScreen extends StatefulWidget {
  final ConsultingModel consultingModel;

  const MyPagePaymentScreen({Key key, this.consultingModel}) : super(key: key);

  @override
  State<MyPagePaymentScreen> createState() => _MyPagePaymentScreenState();
}

class _MyPagePaymentScreenState extends State<MyPagePaymentScreen> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController exportableMoneyController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

  List<String> bankDropdownItems = [];
  var bankCode = {
    "001": "한국은행",
    "002": "산업은행",
    "003": "기업은행",
    "004": "국민은행",
    "007": "수협은행",
    "008": "수출입은행",
    "011": "NH농협은행",
    "012": "지역농축협",
    "020": "우리은행",
    "023": "SC제일은행",
    "027": "한국씨티은행",
    "031": "대구은행",
    "032": "부산은행",
    "034": "광주은행",
    "035": "제주은행",
    "037": "전북은행",
    "039": "경남은행",
    "041": "우리카드",
    "045": "새마을금고",
    "048": "신협",
    "050": "저축은행",
    "052": "모건스탠리은행",
    "054": "HSBC은행",
    "055": "도이치은행",
    "057": "제이피모간체이스은행",
    "058": "미즈호은행",
    "059": "엠유에프지은행",
    "060": "BOA은행",
    "061": "비엔피파리바은행",
    "062": "중국공상은행",
    "063": "중국은행",
    "064": "산림조합중앙회",
    "065": "대화은행",
    "066": "교통은행",
    "067": "중국건설은행",
    "071": "우체국",
    "076": "신용보증기금",
    "077": "기술보증기금",
    "081": "하나은행",
    "088": "신한은행",
    "089": "케이뱅크",
    "090": "카카오뱅크",
    "092": "토스뱅크"
  };

  List<ConsultingModel> latestConsultingList;

  var bankValue;

  Future<void> _loadData(BuildContext context, bool reload) async {
    Provider.of<ConsultingProvider>(context, listen: false)
        .getLatestConsultingList(0, context);

    latestConsultingList =
        Provider.of<ConsultingProvider>(context, listen: false)
            .latestConsultingList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, true);
  }

  @override
  Widget build(BuildContext context) {
    bankDropdownItems = [];
    bankCode.entries.forEach((element) {
      bankDropdownItems.add("${element.value} / ${element.key}");
    });
    bankDropdownItems.sort((a, b) => a.compareTo(b));

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('SETTLEMENT_AMOUNT', context)}",
                  isMyPageHidden: true,
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
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 126),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Consumer<ConsultingProvider>(
                              builder: (context, consultingProvider, child) {
                                List<ConsultingModel> consultingList =
                                    consultingProvider.latestConsultingList;

                                print(
                                    '========hello hello===>${consultingList.length}');

                                return Column(children: [
                                  !consultingProvider.filterFirstLoading
                                      ? consultingList.length != 0
                                          ? StaggeredGridView.countBuilder(
                                              itemCount: consultingList.length,
                                              crossAxisCount: 1,
                                              padding: EdgeInsets.all(0),
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              // scrollDirection:
                                              //     isHomePage ? Axis.horizontal : Axis.vertical,
                                              shrinkWrap: true,
                                              staggeredTileBuilder:
                                                  (int index) =>
                                                      StaggeredTile.fit(1),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      12, 10, 15, 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color(0xffEEEEEE),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('NAME_CUSTOMER', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].client_name : ""}",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 9),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('PAYMENT_DAY', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].payment_amount : ""}",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 9),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('COUNSELING_NAME', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].consulting_title : ""}",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 9),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('PAYMENT_AMOUNT', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].payment_amount : ""}${getTranslated('WON', context)}",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 9),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('STATUS_PAYMENT', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${getTranslated('RESERVATION_DEPOSIT_COMPLETED', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffFF9924),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 9),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('COMMISSION', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].commission : ""}${getTranslated('PERCENT', context)}",
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff333333),
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        height: 11,
                                                        thickness: 1,
                                                        indent: 0,
                                                        endIndent: 0,
                                                        color:
                                                            Color(0xffeeeeee),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${getTranslated('FINAL_AMOUNT', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffbbbbbb),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "${consultingList[index] != null ? consultingList[index].final_amount : ""}${getTranslated('WON', context)}",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffFF0000),
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_DEFAULT),
                                                    ],
                                                  ),
                                                );
                                              },
                                            )
                                          : SizedBox.shrink()
                                      : ProductShimmer(
                                          isEnabled:
                                              consultingProvider.firstLoading,
                                          isHomePage: false,
                                        ),
                                  consultingProvider.filterIsLoading
                                      ? Center(
                                          child: Padding(
                                          padding: EdgeInsets.all(
                                              Dimensions.ICON_SIZE_EXTRA_SMALL),
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<
                                                    Color>(
                                                Theme.of(context).primaryColor),
                                          ),
                                        ))
                                      : SizedBox.shrink(),
                                ]);
                              },
                            ),

                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "${getTranslated('WITH_DRAWABLE_AMOUNT', context)}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    controller: exportableMoneyController,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 7.5,
                                      horizontal: 10,
                                    ),
                                    readOnly: true,
                                    // hintText: "${getTranslated('HINT_NAME', context)}",
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 13),

                            Row(
                              children: [
                                Text(
                                  "${getTranslated('MY_ACCOUNT', context)}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: CustomDropdownButton2(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 7.5, 10),
                                    //           borderRadius: 5,
                                    //           borderColor: Color(0xffeeeeee),
                                    hint:
                                        '${getTranslated('SELECT_BANK', context)}',
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                    dropdownItems: bankDropdownItems,
                                    value: bankValue,
                                    onChanged: (value) {
                                      setState(() {
                                        bankValue = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    controller: accountNumberController,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10, 7.5, 0, 7.5),
                                    hintText:
                                        "${getTranslated('FILL_IN_ACCOUNT_NUMBER', context)}",
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: CustomElevatedButton(
                                onTap: () {
                                  // ClientsModel clientsModel = ClientsModel(
                                  //   phoneNum: phoneNumberTextEditingController.text,
                                  //   password: passwordTextEditingController.text,
                                  // );
                                  //
                                  // Provider.of<ClientsProvider>(context, listen: false)
                                  //     .login(clientsModel, route);
                                },
                                buttonText:
                                    "${getTranslated('APPLICATION_FOR_WITHDRAWAL', context)}",
                                padding: EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ),
                      FooterPage(),
                    ],
                  ),
                ),
              ],
            ),
            // Positioned(
            //   bottom: 0,
            //   child: FooterPage(),
            // ),
          ],
        ),
      ),
    );
  }
}
