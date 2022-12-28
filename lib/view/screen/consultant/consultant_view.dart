import 'package:flutter/material.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:yeka/view/screen/consultant/consultant_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/user_model.dart';
import '../../../provider/user_provider.dart';

class ConsultantView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  ConsultantView(
      {@required this.isHomePage, this.scrollController, this.sellerId});

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
          Provider.of<UserProvider>(context, listen: false)
                  .latestConsultantList
                  .length !=
              0 &&
          !Provider.of<UserProvider>(context, listen: false).filterIsLoading) {
        int pageSize = (Provider.of<UserProvider>(context, listen: false)
                    .latestConsultantPageSize /
                6)
            .ceil();
        offset =
            Provider.of<UserProvider>(context, listen: false).lConsultantOffset;

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

          print('end of the current page');

          Provider.of<UserProvider>(context, listen: false)
              .getLatestConsultantList(offset, context);
        }
      }
    });

    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        List<UserModel> userList = [];
        userList = userProvider.latestConsultantList;

        print('========hello hello===>${userList.length}');

        return Column(children: [
          !userProvider.filterFirstLoading
              ? userList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? userList.length > 4
                              ? 4
                              : userList.length
                          : userList.length,
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection:
                      //     isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return ConsultantWidget(userModel: userList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage,
                  isEnabled: userProvider.firstLoading),
          userProvider.filterIsLoading
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
