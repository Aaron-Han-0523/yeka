import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/util/dimensions.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
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
  Map user = Map();
  String userImagePath;
  List<bool> _selections1 = List.generate(6, (index) => false);
  List<bool> _selections2 = List.generate(6, (index) => false);

  Future<void> _loadData(BuildContext context, bool reload) async {
    user = Provider.of<AuthProvider>(context, listen: false).getUser();
    ImageModel imageModel = new ImageModel(user_id: user["id"], image_type: 5);

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getUserImage(imageModel);
    userImagePath =
        Provider.of<CustomImageProvider>(context, listen: false).image.path;
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

                        SizedBox(
                          height: Dimensions.PADDING_SIZE_LARGE,
                        ),

                        CustomElevatedButton(
                          onTap: () {
                            if (controller.selectedDate != null) {
                              ConsultingModel consultingModel = ConsultingModel(
                                consultant_id: widget.userModel.id,
                                client_id: user["id"],
                                client_name: user["name"],
                                client_image: userImagePath,
                                client_phone: user['phone'],
                                reservation_date:
                                    DateConverter.localDateToIsoString(
                                  controller.selectedDate,
                                ),
                                consulting_title: widget.menuModel.menu_title,
                                payment_status: 0,
                                consulting_status: 0,
                                season: user["season"],
                                detail_season_type: user["detail_season_type"],
                                payment_amount: widget.menuModel.menu_amount,
                                reservation_amount:
                                    widget.menuModel.menu_amount ~/ 10,
                                final_amount: widget.menuModel.menu_amount -
                                    widget.menuModel.menu_amount ~/ 10,
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
                                    content: Text(
                                        "${getTranslated('PLEASE_SELECT_DATE', context)}"),
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

  Widget timeBuilder() {
    List<String> morningTimeList = [
      '07:00',
      '08:00',
      '09:00',
      '10:00',
      '11:00',
      '12:00',
    ];
    List<String> afternoonTimeList = [
      '13:00',
      '14:00',
      '15:00',
      '16:00',
      '17:00',
      '18:00',
    ];

    // DateConverter.isoStringToLocalTimeOnly()
    return Column(
      children: [
        Text(
          "${getTranslated('MORNING', context)}",
        ),
        ToggleButtons(
          children: [
            for (String morningTime in morningTimeList) Text(morningTime),
          ],
          onPressed: (int index) {
            setState(() {
              _selections1[index] = !_selections1[index];
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.green[400],
          fillColor: Colors.green[200],
          color: Colors.green[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 60.0,
          ),
          isSelected: _selections1,
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_LARGE,
        ),
        Text(
          "${getTranslated('AFTERNOON', context)}",
        ),
        ToggleButtons(
          children: [
            for (String afternoonTime in afternoonTimeList) Text(afternoonTime),
          ],
          onPressed: (int index) {
            setState(() {
              _selections2[index] = !_selections2[index];
            });
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
      ],
    );
  }
}
