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
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      // CustomElevatedButton(
                      //     onTap: () {}, buttonText: "더보기 ∨"),
                      Text("$selectDate"),

                      Container(
                        child: SfDateRangePicker(
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.single,
                        ),
                      ),

                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black12,
                      ),

                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                      ),
                    ],
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
