import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/provider/operation_setting_provider.dart';
import 'package:yeka/util/dimensions.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/operation_setting_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import 'consultant_reserve_screen.dart';

class ConsultantCalendarScreen extends StatefulWidget {
  final MenuModel menuModel;
  final UserModel userModel;

  ConsultantCalendarScreen({this.menuModel, this.userModel});

  @override
  State<ConsultantCalendarScreen> createState() =>
      _ConsultantCalendarScreenState();
}

class _ConsultantCalendarScreenState extends State<ConsultantCalendarScreen> {
  final ScrollController _scrollController = ScrollController();

  String selectDate;
  DateRangePickerController controller = DateRangePickerController();
  Map user = Map();
  String userImagePath;
  List<ConsultingModel> consultingList = [];
  OperationSettingModel operationSetting;


  Future<void> _loadData(BuildContext context, bool reload) async {
    user = Provider.of<AuthProvider>(context, listen: false).getUser();
    ImageModel imageModel = new ImageModel(user_id: user["id"], image_type: 5);
    ConsultingModel consultingModel =
        new ConsultingModel(consultant_id: widget.menuModel.consultant_id);

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getUserImage(imageModel);
    userImagePath =
        Provider.of<CustomImageProvider>(context, listen: false).image.path;

    await Provider.of<OperationSettingProvider>(context, listen: false)
        .getOperationSetting();
    operationSetting =
        Provider.of<OperationSettingProvider>(context, listen: false)
            .operationSetting;

    await Provider.of<ConsultingProvider>(context, listen: false)
        .getConsultingByClientIdList(consultingModel);
    consultingList =
        Provider.of<ConsultingProvider>(context, listen: false).consultingList;

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectDate = args.value.toString().substring(0, 10);
    });
  }

  Widget timeBuilder() {

    String week_setting =
    operationSetting != null ? operationSetting.week_setting : "0000000";

    // Set check box time
    int start_time =
    int.parse(operationSetting != null ? operationSetting.start_time : "9");
    int end_time =
    int.parse(operationSetting != null ? operationSetting.end_time : "18");
    List<String> timeList = [];

    // Make operation_time list
    for (int i = start_time; i <= end_time; i++) {
      if (i < 10) {
        String time = '$i';
        time = '0' + time;
        timeList.add(time);
      } else {
        String time = '$i';
        timeList.add(time);
      }
    }

    int firstTimeRow;
    int secondTimeRow;
    int thirdTimeRow = 0;
    List<String> firstTimeList;
    List<String> secondTimeList;
    List<String> thirdTimeList;

    if ((end_time - start_time) < 12) {
      firstTimeRow = ((end_time - start_time) / 2).ceil();
      secondTimeRow = timeList.length - firstTimeRow;

      firstTimeList = timeList.sublist(0, firstTimeRow);
      secondTimeList = timeList.sublist(firstTimeRow, timeList.length);
    } else {
      firstTimeRow = 6;
      secondTimeRow = 6;
      thirdTimeRow = (end_time - start_time) - 12 + 1;
      firstTimeList = timeList.sublist(0, 6);
      secondTimeList = timeList.sublist(6, 12);
      thirdTimeList = timeList.sublist(12, timeList.length);
    }
    // Make variable list
    List<bool> _selections1 =
    List.generate(firstTimeRow, (index) => false, growable: true);
    List<bool> _selections2 =
    List.generate(secondTimeRow, (index) => false, growable: true);
    List<bool> _selections3 = [];
    if (thirdTimeRow > 0) {
      _selections3 =
          List.generate(thirdTimeRow, (index) => false, growable: true);
    }

    int state = 0;

    return Column(
      children: [
        ToggleButtons(
          children: [
            for (String firstRow in firstTimeList) Text(firstRow),
          ],
          onPressed: (int index) {
            // if (!_selections1.contains(true) &&
            //     !_selections2.contains(true) &&
            //     !_selections3.contains(true)) {
              setState(() {
                _selections1[index] = !_selections1[index];
              });
            // }

            print(_selections1);
              print(_selections1+_selections2+_selections3);
            if (state == 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('이미 예약된 시간입니다.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.green[400],
          fillColor: Colors.green[200],
          color: Colors.green[400],
          disabledColor: Colors.grey[400],
          disabledBorderColor: Colors.grey[700],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 60.0,
          ),
          isSelected: _selections1,
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        ),
        ToggleButtons(
          children: [
            for (String secondRow in secondTimeList) Text(secondRow),
          ],
          onPressed: (int index) {
            // if (!_selections1.contains(true) &&
            //     !_selections2.contains(true) &&
            //     !_selections3.contains(true)) {
              setState(() {
                _selections2[index] = !_selections2[index];
              });
            // }

            print(_selections2);
              print(_selections1+_selections2+_selections3);
            if (state == 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('이미 예약된 시간입니다.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.orange[700],
          selectedColor: Colors.white,
          fillColor: Colors.orange[200],
          color: Colors.orange[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 60.0,
          ),
          isSelected: _selections2,
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        ),
        thirdTimeRow > 0
            ? ToggleButtons(
                children: [
                  for (String thirdRow in thirdTimeList) Text(thirdRow),
                ],
                onPressed: (int index) {
                  // if (!_selections1.contains(true) &&
                  //     !_selections2.contains(true) &&
                  //     !_selections3.contains(true)) {
                    setState(() {
                      _selections3[index] = !_selections3[index];
                    });
                  // }

                  print(_selections3);
                    print(_selections1+_selections2+_selections3);
                  if (state == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('이미 예약된 시간입니다.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.orange[700],
                selectedColor: Colors.white,
                fillColor: Colors.orange[200],
                color: Colors.orange[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 60.0,
                ),
                isSelected: _selections3,
              )
            : Container(),
        thirdTimeRow > 0
            ? SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              )
            : Container(),
        CustomElevatedButton(
          onTap: () {
            if (controller.selectedDate != null &&
                (_selections1.contains(true) ||
                    _selections2.contains(true) ||
                    _selections3.contains(true))) {
              ConsultingModel consultingModel = ConsultingModel(
                consultant_id: widget.userModel.id,
                client_id: user["id"],
                client_name: user["name"],
                client_image: userImagePath,
                client_phone: user['phone'],
                reservation_date: DateConverter.localDateToIsoString(
                  controller.selectedDate,
                ),
                consulting_title: widget.menuModel.menu_title,
                payment_status: 0,
                consulting_status: 0,
                season: user["season"],
                detail_season_type: user["detail_season_type"],
                payment_amount: widget.menuModel.menu_amount,
                reservation_amount: widget.menuModel.menu_amount ~/ 10,
                final_amount: widget.menuModel.menu_amount -
                    widget.menuModel.menu_amount ~/ 10,
              );

              Provider.of<ConsultingProvider>(context, listen: false)
                  .addConsulting(consultingModel);

              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
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
                    content:
                        Text("${getTranslated('PLEASE_SELECT_DATE', context)}"),
                    backgroundColor: Colors.red),
              );
            }
          },
          buttonText: "${getTranslated('APPLY', context)}",
          padding: const EdgeInsets.symmetric(horizontal: 15),
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
        ),
      ],
    );
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
                            enablePastDates: false,
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

                        timeBuilder(),

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
