import 'dart:async';

import 'package:flutter/material.dart';
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

  List<bool> _selections1 = [];
  List<bool> _selections2 = [];
  List<bool> _selections3 = [];

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

    await Provider.of<ConsultingProvider>(context, listen: false)
        .getConsultingByClientIdList(consultingModel);
    operationSetting =
        Provider.of<OperationSettingProvider>(context, listen: false)
            .operationSetting;
    consultingList =
        Provider.of<ConsultingProvider>(context, listen: false).consultingList;

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
      if (i < 10) {
        String time = '$i';
        time = '0' + time;
        timeList.add(time);
      } else {
        String time = '$i';
        timeList.add(time);
      }
    }
    // Make variable list
    _selections1 = List.generate(firstTimeList.length, (index) {
      bool timeFlag = false;
      for (int i = 0; i < reservation_time.length; i++) {
        if (firstTimeList[index] == reservation_time[i]) {
          timeFlag = true;
          break;
        }
      }
      return timeFlag;
    }, growable: true);
    if (secondTimeList.length > 0) {
      _selections2 = List.generate(secondTimeList.length, (index) {
        bool timeFlag = false;
        for (int i = 0; i < reservation_time.length; i++) {
          if (secondTimeList[index] == reservation_time[i]) {
            timeFlag = true;
            break;
          }
        }
        return timeFlag;
      }, growable: true);
    }
    if (thirdTimeList.length > 0) {
      _selections3 = List.generate(thirdTimeList.length, (index) {
        bool timeFlag = false;
        for (int i = 0; i < reservation_time.length; i++) {
          if (thirdTimeList[index] == reservation_time[i]) {
            timeFlag = true;
            break;
          }
        }
        return timeFlag;
      }, growable: true);
    }

    setState(() {});
  }

  @override
  void didChangeDependencies() async {
    await _loadData(context, false);

    super.didChangeDependencies();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      selectDate = args.value.toString().substring(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsultingProvider>(
        builder: (context, consultingProvider, child) {
          List<ConsultingModel> consultingList = consultingProvider.consultingList;

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

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SfDateRangePicker(
                                  controller: controller,
                                  todayHighlightColor: Colors.blue,
                                  selectionColor: Colors.black,
                                  onSelectionChanged: _onSelectionChanged,
                                  selectionMode:
                                  DateRangePickerSelectionMode.single,
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
        });
  }

  Widget timeBuilder() {
    return Column(
      children: [
        ToggleButtons(
            children: [
              if (timeList.length >= 1) Text(timeList[0]),
              if (timeList.length >= 2) Text(timeList[1]),
              if (timeList.length >= 3) Text(timeList[2]),
              if (timeList.length >= 4) Text(timeList[3]),
              if (timeList.length >= 5) Text(timeList[4]),
            ],
            onPressed: (int index) {
              print("$reservation_date $reservation_time");

              // 날짜와 시간
              // 데이터는 받아왔다.
              // [2023-02-17T15:00:00.000Z] [18]

              for (String time in reservation_time) {
                for (int i = 0; i < 5; i++) {
                  if (timeList[i].contains(time)) {
                    _selections1[index] == null;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('이미 예약된 시간입니다.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              }

              // 조건 처리해서 눌러지지 않도록 하고 싶다.
              // if() => 일단 timeList 가 있다. 어떻게 활용하지?
              // timeList => 07, 08, 09
              // for(int i=0; i< timeList.length; i++) {
              // timeList[i]
              //}
              // if()

              // [2023-02-17T15:00:00.000Z] [18]

              if (_selections1[index] == true) {
                // check 역활
                setState(() {
                  _selections1[index] = !_selections1[index];
                });
              } else if (!_selections1.contains(true) &&
                  !_selections2.contains(true) &&
                  !_selections3.contains(true)) {
                // 다른 하나가 check 되었을 때 X
                setState(() {
                  _selections1[index] = !_selections1[index];
                });
              }
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            disabledBorderColor: Colors.black,
            disabledColor: Colors.black,
            selectedBorderColor: Colors.green[700],
            selectedColor: Colors.green[400],
            fillColor: Colors.green[200],
            color: Colors.green[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 60.0,
            ),
            isSelected: _selections1),
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        ),
        secondTimeList.length > 0
            ? ToggleButtons(
            children: [
              if (timeList.length >= 6) Text(timeList[5]),
              if (timeList.length >= 7) Text(timeList[6]),
              if (timeList.length >= 8) Text(timeList[7]),
              if (timeList.length >= 9) Text(timeList[8]),
              if (timeList.length >= 10) Text(timeList[9]),
            ],
            onPressed: (int index) {


              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('이미 예약된 시간입니다.'),
                  duration: Duration(seconds: 2),
                ),
              );



              print(_selections1 + _selections2 + _selections3);
              if (_selections2[index] == true) {
                setState(() {
                  _selections2[index] = !_selections2[index];
                });
              } else if (!_selections1.contains(true) &&
                  !_selections2.contains(true) &&
                  !_selections3.contains(true)) {
                setState(() {
                  _selections2[index] = !_selections2[index];
                });
              }

            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            disabledBorderColor: Colors.black,
            disabledColor: Colors.black,
            selectedBorderColor: Colors.orange[700],
            selectedColor: Colors.white,
            fillColor: Colors.orange[200],
            color: Colors.orange[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 60.0,
            ),
            isSelected: _selections2)
            : Container(),
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        ),
        thirdTimeList.length > 0
            ? ToggleButtons(
            children: [
              if (timeList.length >= 11) Text(timeList[10]),
              if (timeList.length >= 12) Text(timeList[11]),
              if (timeList.length >= 13) Text(timeList[12]),
              if (timeList.length >= 14) Text(timeList[13]),
              if (timeList.length >= 15) Text(timeList[14]),
            ],
            onPressed: (int index) {


              for (String time in reservation_time) {
                for (int i = 10; i < 15; i++) {
                  if (timeList[i].contains(time)) {
                    _selections3[index] = !_selections3[index];

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('이미 예약된 시간입니다.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              }

              print(_selections1 + _selections2 + _selections3);
              if (_selections3[index] == true) {
                setState(() {
                  _selections3[index] = !_selections3[index];
                });
              } else if (!_selections1.contains(true) &&
                  !_selections2.contains(true) &&
                  !_selections3.contains(true)) {
                setState(() {
                  _selections3[index] = !_selections3[index];
                });
              }
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            disabledBorderColor: Colors.black,
            disabledColor: Colors.black,
            selectedBorderColor: Colors.purple[700],
            selectedColor: Colors.white,
            fillColor: Colors.purple[200],
            color: Colors.purple[400],
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 60.0,
            ),
            isSelected: _selections3)
            : Container(),
        thirdTimeList.length > 0
            ? SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        )
            : Container(),
        CustomElevatedButton(
          onTap: () {
            List<bool> result = _selections1 + _selections2 + _selections3;
            int index = result.indexOf(true);
            String time = timeList[index];

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
                reservation_date:
                DateConverter.localDateToIsoString(controller.selectedDate),
                // controller.selectedDate.toString().substring(0, 10),
                reservation_time: time,
                consulting_title: widget.menuModel.menu_title,
                payment_status: 0,
                consulting_status: 1,
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
}
