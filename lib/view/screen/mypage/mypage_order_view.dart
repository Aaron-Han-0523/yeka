import 'package:flutter/material.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/product_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/order_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/consulting_provider.dart';
import '../../../provider/order_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//images.dart';
import 'mypage_client_widget.dart';
import 'mypage_order_detail_screen.dart';

class MyPageOrderView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController scrollController;
  final String sellerId;

  MyPageOrderView(
      {@required this.isHomePage, this.scrollController, this.sellerId});

  @override
  State<MyPageOrderView> createState() => _MyPageOrderViewState();
}

class _MyPageOrderViewState extends State<MyPageOrderView> {
  int offset = 0;

  @override
  Widget build(BuildContext context) {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.maxScrollExtent ==
              widget.scrollController.position.pixels &&
          Provider.of<OrderProvider>(context, listen: false)
                  .latestOrderList
                  .length !=
              0 &&
          !Provider.of<OrderProvider>(context, listen: false)
              .filterIsLoading) {
        int pageSize = (Provider.of<OrderProvider>(context, listen: false)
                    .latestPageSize /
                6)
            .ceil();
        offset =
            Provider.of<OrderProvider>(context, listen: false).lOffset;

        if (offset <= pageSize) {
          print('offset =====>$offset and page size ====>$pageSize');
          offset++;
          print('offset =====>$offset and page size ====>$pageSize');

          print('end of the current page');
          // Provider.of<ProductProvider>(context, listen: false)
          //     .showBottomLoader();
          int user_id = Provider.of<AuthProvider>(context, listen: false).getUser()["id"];

          Provider.of<OrderProvider>(context, listen: false)
              .getLatestOrderList(offset, user_id, context);
        }
      }
    });

    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        List<OrderModel> orderList = orderProvider.latestOrderList;

        print('========hello hello===>${orderList.length}');

        return Column(children: [
          !orderProvider.filterFirstLoading
              ? orderList.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: widget.isHomePage
                          ? orderList.length > 4
                              ? 4
                              : orderList.length
                          : orderList.length,
                      crossAxisCount: 1,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      // isHomePage ? Axis.horizontal : Axis.vertical,
                      shrinkWrap: true,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyPageOrderDetailPage(orderModel: orderList[index],),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: Images.placeholder1,
                                      image: orderList != null && orderList[index].image1 != null
                                          ? AppConstants.BASE_URL +
                                          "/" +
                                          orderList[index].image1
                                          : AppConstants.BASE_URL +
                                          "/placeholder_1x1.png",
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            //fixme 주문서 번호가 테이블에 확인이 안되어 일단 표시만 해둠
                                            "${getTranslated('ORDER_NUMBER', context)}:2022112492135423",
                                            style: TextStyle(
                                                color: Color(0xff999999),
                                                fontSize: 7,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            "${getTranslated('PAYMENT_COMPLETED', context)}",
                                            style: TextStyle(
                                                color: Color(0xff0123B4),
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${orderList != null ? orderList[index].title : ""}",
                                            style: TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: 120,
                                            child: Text(
                                              "${getTranslated('COLOR_', context)}${orderList != null ? orderList[index].option : ""}",
                                              style: TextStyle(
                                                color: Color(0xff999999),
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${getTranslated('|', context)}",
                                            style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${getTranslated('AMOUNT_', context)}${orderList != null ? orderList[index].quantity : ""}${getTranslated('SOME', context)}",
                                            style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${getTranslated('|', context)}",
                                            style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${orderList != null ? DateConverter.stringToDateOnly(orderList[index].create_date) : ""}",
                                            style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                                      Row(
                                        children: [
                                          Text(
                                            "${orderList != null ? PriceConverter.convertPrice(context, orderList[index].price.toDouble()) : ""}${getTranslated('WON', context)}",
                                            style: TextStyle(
                                              color: Color(0xff0123B4),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: widget.isHomePage,
                  isEnabled: orderProvider.firstLoading),
          orderProvider.filterIsLoading
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
