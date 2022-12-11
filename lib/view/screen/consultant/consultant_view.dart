import 'package:flutter/material.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:yeka/view/screen/consultant/consultant_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../provider/consulting_provider.dart';

class ConsultantView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  ConsultantView(
      {@required this.isHomePage,
      this.scrollController,
      this.sellerId});

  @override
  State<ConsultantView> createState() => _ConsultantViewState();
}

class _ConsultantViewState extends State<ConsultantView> {
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.maxScrollExtent ==
          widget.scrollController.position.pixels &&
          Provider.of<ConsultingProvider>(context, listen: false)
              .latestConsultingList
              .length !=
              0 &&
          !Provider.of<ConsultingProvider>(context, listen: false)
              .filterIsLoading) {
        int pageSize = (Provider.of<ConsultingProvider>(context, listen: false)
            .latestPageSize /
            6)
            .ceil();
        offset = Provider.of<ConsultingProvider>(context, listen: false).lOffset;

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

          print('end of the current page');
          // Provider.of<ReviewProvider>(context, listen: false)
          //     .showBottomLoader();

          Provider.of<ConsultingProvider>(context, listen: false)
              .getLatestConsultingList(offset, context);
        }
      }
    });

    return Consumer<ConsultingProvider>(
      builder: (context, reviewProvider, child) {
        List<ConsultingModel> reviewList = [];
        reviewList = reviewProvider.latestConsultingList;

        print('========hello hello===>${reviewList.length}');

        return Column(children: [
          !reviewProvider.filterFirstLoading
              ? reviewList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? reviewList.length > 4
                              ? 4
                              : reviewList.length
                          : reviewList.length,
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection:
                      //     isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return ConsultantWidget(consultingModel: reviewList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage, isEnabled: reviewProvider.firstLoading),
          reviewProvider.filterIsLoading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))
              : SizedBox.shrink(),
        ]);
      },
    );
  }
}
