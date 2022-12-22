import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/helper/date_converter.dart';

import 'package:yeka/utill/dimensions.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../basewidget/button/custom_elevated_button.dart';
import 'consultant_reserve_screen.dart';

class ConsultantCalendarScreen extends StatefulWidget {
  final ConsultingModel consultingModel;
  final MenuModel menuModel;
  final UserModel userModel;

  ConsultantCalendarScreen(
      {this.consultingModel, this.menuModel, this.userModel});

  @override
  State<ConsultantCalendarScreen> createState() =>
      _ConsultantCalendarScreenState();
}

class _ConsultantCalendarScreenState extends State<ConsultantCalendarScreen> {
  final ScrollController _scrollController = ScrollController();

  String selectDate;
  DateRangePickerController controller = DateRangePickerController();
  int user_id;

  Future<void> _loadData(BuildContext context, bool reload) async {
    user_id = Provider.of<AuthProvider>(context, listen: false).getUser()["id"];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print("${args.value}");
    setState(() {
      selectDate = args.value.toString().substring(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('SELECT_DATE', context)}",
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Color(0xffDDDDDD),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        // CustomElevatedButton(
                        //     onTap: () {}, buttonText: "더보기 ∨"),
                        selectDate != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 92,
                                      height: 25,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 7, 10, 7),
                                      decoration: BoxDecoration(
                                        color: Color(0xff121212),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        "$selectDate",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: 25,
                              ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SfDateRangePicker(
                            controller: controller,
                            todayHighlightColor: Colors.blue,
                            selectionColor: Colors.black,
                            onSelectionChanged: _onSelectionChanged,
                            selectionMode: DateRangePickerSelectionMode.single,
                          ),
                        ),

                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.black12,
                        ),

                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),

                        CustomElevatedButton(
                          onTap: () {
                            if (controller.selectedDate != null) {
                              ConsultingModel consultingModel = ConsultingModel(
                                consultant_id: widget.userModel.id,
                                client_id: user_id,
                                reservation_date:
                                    DateConverter.localDateToIsoString(
                                  controller.selectedDate,
                                ),
                                consulting_status: 1,
                                final_amount: widget.menuModel.menu_amount - widget.menuModel.menu_amount ~/ 10,
                                reservation_amount: widget.menuModel.menu_amount ~/ 10,
                                payment_amount: widget.menuModel.menu_amount,
                                consulting_title: widget.menuModel.menu_title,
                              );

                              Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                  .addConsulting(consultingModel);

                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (context, anim1, anim2) =>
                                      ConsultantReserveScreen(
                                    menuModel: widget.menuModel,
                                    userModel: widget.userModel,
                                    consultingModel: consultingModel,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("날짜를 선택하세요."),
                                    backgroundColor: Colors.red),
                              );
                            }
                          },
                          buttonText: "적용하기",
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),

                        SizedBox(
                          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        ),
                        // SizedBox(
                        //   height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                        // ),
                      ],
                    ),
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
