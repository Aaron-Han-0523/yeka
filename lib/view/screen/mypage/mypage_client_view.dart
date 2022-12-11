import 'package:flutter/material.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/product_model.dart';
import '../../../provider/product_provider.dart';
import 'mypage_client_widget.dart';

class MyPageClientView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  MyPageClientView(
      {@required this.isHomePage,
      this.scrollController,
      this.sellerId});

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
          Provider.of<ProductProvider>(context, listen: false)
              .latestProductList
              .length !=
              0 &&
          !Provider.of<ProductProvider>(context, listen: false)
              .filterIsLoading) {
        int pageSize = (Provider.of<ProductProvider>(context, listen: false)
            .latestPageSize /
            6)
            .ceil();
        offset = Provider.of<ProductProvider>(context, listen: false).lOffset;

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

          print('end of the current page');
          // Provider.of<ProductProvider>(context, listen: false)
          //     .showBottomLoader();

          Provider.of<ProductProvider>(context, listen: false)
              .getLatestProductList(offset, context);
        }
      }
    });

    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        List<ProductModel> productList = [];
        productList = productProvider.latestProductList;

        print('========hello hello===>${productList.length}');

        return Column(children: [
          !productProvider.filterFirstLoading
              ? productList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? productList.length > 4
                              ? 4
                              : productList.length
                          : productList.length,
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                          // isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return MyPageClientWidget(productModel: productList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage, isEnabled: productProvider.firstLoading),
          productProvider.filterIsLoading
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
