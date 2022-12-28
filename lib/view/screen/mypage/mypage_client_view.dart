import 'package:flutter/material.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../provider/consulting_provider.dart';
import 'mypage_client_widget.dart';

class MyPageClientView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  MyPageClientView(
      {@required this.isHomePage, this.scrollController, this.sellerId});

  @override
  State<MyPageClientView> createState() => _MyPageClientViewState();
}

class _MyPageClientViewState extends State<MyPageClientView> {
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
        offset =
            Provider.of<ConsultingProvider>(context, listen: false).lOffset;

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

          print('end of the current page');
          // Provider.of<ProductProvider>(context, listen: false)
          //     .showBottomLoader();

          Provider.of<ConsultingProvider>(context, listen: false)
              .getLatestConsultingList(offset, context);
        }
      }
    });

    return Consumer<ConsultingProvider>(
      builder: (context, consultingProvider, child) {
        List<ConsultingModel> consultingList = [];
        consultingList = consultingProvider.latestConsultingList;

        print('========hello hello===>${consultingList.length}');

        return Column(children: [
          !consultingProvider.filterFirstLoading
              ? consultingList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? consultingList.length > 4
                              ? 4
                              : consultingList.length
                          : consultingList.length,
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      // isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return MyPageClientWidget(
                            consultingModel: consultingList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage,
                  isEnabled: consultingProvider.firstLoading),
          consultingProvider.filterIsLoading
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
