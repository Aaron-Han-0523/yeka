import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyPageCalendarScreen extends StatefulWidget {
  @override
  State<MyPageCalendarScreen> createState() => _MyPageCalendarScreenState();
}

class _MyPageCalendarScreenState extends State<MyPageCalendarScreen> {
  final ScrollController _scrollController = ScrollController();

  String selectDate;

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
                  "날짜 선택",
                ).getAppbar(),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              children: [
                                Container(
                                  width: 92,
                                  height: 25,
                                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                  decoration: BoxDecoration(
                                    color: Color(0xff121212),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                      "$selectDate",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                  ),
                                ),
                              ],
                            ),
                        ),


                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),

                          child: SfDateRangePicker(
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

                        // CustomElevatedButton(
                        //   onTap: () {},
                        //   buttonText: "적용",
                        //   padding: const EdgeInsets.symmetric(horizontal: 15),
                        // ),


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
