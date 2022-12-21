import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/helper/date_converter.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/consulting_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/consulting_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../basewidget/button/custom_elevated_button.dart';

class MyPageCalendarScreen extends StatefulWidget {
  final ConsultingModel consultingModel;

  MyPageCalendarScreen({this.consultingModel});

  @override
  State<MyPageCalendarScreen> createState() => _MyPageCalendarScreenState();
}

class _MyPageCalendarScreenState extends State<MyPageCalendarScreen> {
  final ScrollController _scrollController = ScrollController();

  String selectDate;
  DateRangePickerController controller = DateRangePickerController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                            widget.consultingModel.reservation_date = DateConverter.localDateToIsoString(controller.selectedDate);
                            widget.consultingModel.consulting_status = 1;
                            Provider.of<ConsultingProvider>(context, listen: false).updateConsulting(widget.consultingModel);

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
            Positioned(
              bottom: 0,
              child: FooterPage(),
            ),
          ],
        ),
      ),
    );
  }
}
