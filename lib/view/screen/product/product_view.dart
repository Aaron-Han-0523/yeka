import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:yeka/view/screen/product/product_widget.dart';

import '../../../data/model/response/product_model.dart';
import '../../../provider/product_provider.dart';

class ProductView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;

  ProductView({
    @required this.isHomePage,
    this.scrollController,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
              .getLatestProductList(offset, context, reload: true);
        }
      }
    });

    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        List<ProductModel> productList = [];
        productList = productProvider.latestProductList;

        print('========hello hello===>${productList.length}');

        return productList.length > 0
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: widget.isHomePage ? 220 : double.infinity,
                ),
                child: GridView.builder(
                  itemCount: productList.length,
                  // crossAxisCount: widget.isHomePage ? 1 : 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.isHomePage ? 1 : 2,
                    childAspectRatio: widget.isHomePage ? (1 / 0.8) : (1 / 1.2),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                  ),
                  // padding: EdgeInsets.all(0),
                  physics: widget.isHomePage
                      ? AlwaysScrollableScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  scrollDirection:
                      widget.isHomePage ? Axis.horizontal : Axis.vertical,
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(productModel: productList[index]);
                  },
                ),
              )
            : ProductShimmer(
                isHomePage: widget.isHomePage,
                isEnabled: productProvider.firstLoading);
      },
    );
  }
}
