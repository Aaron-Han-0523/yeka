import 'package:flutter/material.dart';

import 'package:byher/utill/color_resources.dart';
import 'package:byher/utill/images.dart';
import 'package:byher/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';

class MyProcessLoadingDisposalPage extends StatefulWidget {
  @override
  State<MyProcessLoadingDisposalPage> createState() =>
      _MyProcessLoadingDisposalPageState();
}

class _MyProcessLoadingDisposalPageState
    extends State<MyProcessLoadingDisposalPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('LOADING_DISPOSAL', context)}",).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.loading_disposal,
                        // height: 35,
                      ),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
