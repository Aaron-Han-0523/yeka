import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/provider/operation_setting_provider.dart';
import 'package:yeka/util/dimensions.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/operation_setting_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
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

  OperationSettingModel operationSetting;

  int start_time;
  int end_time;
  List<String> reservation_date = [];
  List<String> reservation_time = [];

  List<ConsultingModel> consultingList = [];
  List<String> timeList = [];
  List<int> intTimeList = [];
  List<int> firstTimeList = [];
  List<int> secondTimeList = [];
  List<int> thirdTimeList = [];

  List<bool> checkList = [];
  List<DateTime> _blackoutDates;

  String weekSetting;

  void _loadDayData(BuildContext context, bool reload) {
    checkList = [];

    // checkList 예약시간 인덱스는 false 아니면 true
    for (int i = 0; i < timeList.length; i++) {
      checkList.add(true);
    }

    for (int i = 0; i < consultingList.length; i++) {
      if(selectDate == reservation_date[i].substring(0, 10)) {
        checkList[int.parse(reservation_time[i]) - start_time] = false;
      }
    }

    setState(() {});
  }

  Future<void> _loadData(BuildContext context, bool reload) async {
    user = Provider.of<AuthProvider>(context, listen: false).getUser();
    ImageModel imageModel = new ImageModel(user_id: user["id"], image_type: 5);

    ConsultingModel consultingModel =
        new ConsultingModel(consultant_id: widget.menuModel.consultant_id);

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getUserImage(imageModel);

    await Provider.of<ConsultingProvider>(context, listen: false)
        .getConsultingByClientIdList(consultingModel, reload: true);

    await Provider.of<OperationSettingProvider>(context, listen: false)
        .getOperationSetting();

    userImagePath =
        Provider.of<CustomImageProvider>(context, listen: false).image.path;

    consultingList =
        Provider.of<ConsultingProvider>(context, listen: false).consultingList;

    operationSetting =
        Provider.of<OperationSettingProvider>(context, listen: false)
            .operationSetting;

    start_time =
        int.parse(operationSetting != null ? operationSetting.start_time : "9");

    end_time =
        int.parse(operationSetting != null ? operationSetting.end_time : "18");

    for (int i = start_time; i <= end_time; i++) {
      if (i < start_time + 5) {
        firstTimeList.add(i);
      } else if (i < start_time + 10) {
        secondTimeList.add(i);
      } else if (i < start_time + 15) {
        thirdTimeList.add(i);
      }
    }

    for (ConsultingModel consulting in consultingList) {
      reservation_date.add(consulting.reservation_date);
      reservation_time.add(consulting.reservation_time);
    }

    // Make operation_time list
    for (int i = start_time; i <= end_time; i++) {
      String time = '$i';
      timeList.add(time);
    }

    setState(() {});
  }

  // disable 할 날짜를 dates list에 담아 return
  List<DateTime> _getBlackoutDates() {
    final List<DateTime> dates = <DateTime>[];
    DateTime dateTime1 = DateTime.now();

    weekSetting = operationSetting != null ? operationSetting.week_setting : "";
    List<String> dayList = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    for (int i = 0; i < 30; i++) {
      DateTime dateTime2 = dateTime1.add(Duration(days: i));
      var day = DateFormat('EEEE').format(dateTime2);

      if(weekSetting[dayList.indexOf(day)] == "0") {
        dates.add(dateTime2);
      }
    }

    return dates;
  }

  @override
  void didChangeDependencies() async {
    await _loadData(context, false);
    // datePicker diable
    _blackoutDates = _getBlackoutDates();
    super.didChangeDependencies();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectDate = args.value.toString().substring(0, 10);
      _loadDayData(context, true);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Consumer<ConsultingProvider>(
        builder: (context, consultingProvider, child) {

          // out of Memory 오류 발생
          // for(int i = 0; i < timeList.length; i++) {
          //   if (i < 10) {
          //     String time = '$i';
          //     time = '0' + time;
          //     timeList.add(time);
          //   } else {
          //     String time = '$i';
          //     timeList.add(time);
          //   }
          // }
          // print(timeList);

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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 92,
                                        height: 25,
                                        padding:
                                            EdgeInsets.fromLTRB(10, 7, 10, 7),
                                        decoration: BoxDecoration(
                                          color: Color(0xff121212),
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                          _getBlackoutDatePicker(),
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
                          // ElevatedButton(onPressed: () {print(DateFormat('EEEE').format(DateTime.now()));}, child: Text('test'))
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
    });
  }

  Widget timeBuilder() {
    return Column(
      children: [
        // !!!!!!! 첫번째 Row
        firstTimeList.length > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firstTimeList.length >= 1
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[0]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[0].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[0]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.amber[900], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.amber[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                  ) : Container(),

                  // 1. size 박스
                  firstTimeList.length >= 2
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  firstTimeList.length >= 2
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[1]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[1].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[1]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.amber[900], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.amber[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 2. size 박스
                  timeList.length >= 3
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  timeList.length >= 3
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[2]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[2].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[2]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.amber[900], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.amber[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 3. size 박스
                  timeList.length >= 4
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  timeList.length >= 4
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[3]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[3].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[3]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.amber[900], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.amber[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 4. size 박스
                  timeList.length >= 5
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  timeList.length >= 5
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[4]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[4].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[4]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.amber[900], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.amber[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),
                ],
              )
            : Container(),
        secondTimeList.length > 0
            ? SizedBox(height: 10,)
            : Container(),
        // !!!!!!! 두번째 Row
        secondTimeList.length > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  secondTimeList.length >= 1
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[5]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[5].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[5]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.green[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),
                  // 1. size 박스
                  secondTimeList.length >= 2
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  secondTimeList.length >= 2
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[6]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[6].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[6]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.green[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 2. size 박스
                  secondTimeList.length >= 3
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  secondTimeList.length >= 3
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[7]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[7].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[7]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.green[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 3. size 박스
                  secondTimeList.length >= 4
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  secondTimeList.length >= 4
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[8]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[8].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[8]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.green[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 4. size 박스
                  secondTimeList.length >= 5
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  secondTimeList.length >= 5
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[9]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[9].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[9]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.green[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),
                ],
              )
            : Container(),

        thirdTimeList.length > 0
            ? SizedBox(height: 10,)
            : Container(),
        // !!!!!!! 세번째 Row
        thirdTimeList.length > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  thirdTimeList.length >= 1
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[10]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[10].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[10]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.purple[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),
                  // 1. size 박스
                  thirdTimeList.length >= 2
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  thirdTimeList.length >= 2
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[11]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[11].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[11]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.purple[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 2. size 박스
                  thirdTimeList.length >= 3
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  thirdTimeList.length >= 3
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[12]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[12].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[12]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.purple[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 3. size 박스
                  thirdTimeList.length >= 4
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  thirdTimeList.length >= 4
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[13]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[13].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[13]),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.purple[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),

                  // 4. size 박스
                  thirdTimeList.length >= 5
                      ? SizedBox(
                          width: 10,
                        )
                      : Container(),
                  // button hidden 처리
                  thirdTimeList.length >= 5
                      ? OutlinedButton(
                          onPressed:
                              // 버튼 disable 처리
                              checkList.length > 0 && checkList[14]
                                  ? () {
                                // fixme

                                List<int> selectTimeList = [];
                                for (int i = start_time;
                                i <= end_time;
                                i++) {
                                  selectTimeList.add(i);
                                }
                                String time =
                                selectTimeList[14].toString();

                                if (controller.selectedDate != null) {
                                  ConsultingModel consultingModel = ConsultingModel(
                                    consultant_id: widget.userModel.id,
                                    client_id: user["id"],
                                    client_name: user["name"],
                                    client_image: userImagePath != null ? userImagePath : "",
                                    client_phone: user['phone'],
                                    reservation_date: DateConverter
                                        .localDateToIsoString(
                                        controller.selectedDate),
                                    // controller.selectedDate.toString().substring(0, 10),
                                    reservation_time: time,
                                    consulting_title:
                                    widget.menuModel.menu_title,
                                    payment_status: 0,
                                    consulting_status: 1,
                                    season: user["season"],
                                    detail_season_type:
                                    user["detail_season_type"],
                                    payment_amount:
                                    widget.menuModel.menu_amount,
                                    reservation_amount:
                                    widget.menuModel.menu_amount ~/
                                        10,
                                    final_amount: widget
                                        .menuModel.menu_amount -
                                        widget.menuModel.menu_amount ~/
                                            10,
                                  );

                                  Provider.of<ConsultingProvider>(context,
                                      listen: false)
                                      .addConsulting(consultingModel);

                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, anim1, anim2) =>
                                          ConsultantReserveScreen(
                                            menuModel: widget.menuModel,
                                            userModel: widget.userModel,
                                            consultingModel: consultingModel,
                                          ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "${getTranslated('PLEASE_SELECT_DATE', context)}"),
                                        backgroundColor: Colors.red),
                                  );
                                }


                              }
                                  : null,
                          // 시간 출력
                          child: Text(timeList[14],),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple[600], backgroundColor: Colors.white60,
                        elevation: 20, //<-- SEE HERE
                        shadowColor: Colors.purple[100], //<-- SEE HERE
                        disabledBackgroundColor: Colors.white60,
                        disabledForegroundColor: Colors.black12,
                      )
                        )
                      : Container(),
                ],
              )
            : Container(),

        SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
        ),
      ],
    );
  }

  Container _getBlackoutDatePicker() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SfDateRangePicker(
        controller: controller,
        todayHighlightColor: Colors.blue,
        selectionColor: Colors.black,
        onSelectionChanged: _onSelectionChanged,
        selectionMode: DateRangePickerSelectionMode.single,
        enablePastDates: false,
        maxDate: DateTime.now().add(Duration(days: 30)),
        monthViewSettings: DateRangePickerMonthViewSettings(
            showTrailingAndLeadingDates: true, blackoutDates: _blackoutDates),
      ),
    );
  }
}
