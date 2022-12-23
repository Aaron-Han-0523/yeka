import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_shipping_screen.dart';

import '../../../data/model/response/like_product_model.dart';
import '../../../data/model/response/order_model.dart';
import '../../../data/model/response/product_model.dart';
import '../../../helper/price_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/like_product_provider.dart';
import '../../../provider/option_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final ProductModel productModel;

  const ProductDetailPage(
      {Key key, this.isCreateScreen = true, this.productModel})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  PageController _controller = PageController();

  List<Widget> thumbnailItems = [];
  List<String> detailItems = [];
  List<String> optionDropdownItems = [];

  int optionDropdownValue = 0;
  int _itemCount = 0;

  bool heart = false;

  Future<void> _loadData(BuildContext context, bool reload) async {
    var imageList =
        Provider.of<CustomImageProvider>(context, listen: false).imageList;
    for (var image in imageList) {
      if (image.image_type == 0) {
        thumbnailItems.add(buildPage(image.path));
      } else if (image.image_type == 1) {
        detailItems.add(image.path);
      }
    }

    await Provider.of<OptionProvider>(context, listen: false)
        .getOptionList(context);
    optionDropdownItems = [];
    Provider.of<OptionProvider>(context, listen: false)
        .optionList
        .map((e) => optionDropdownItems.add(e.option_title));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);
  }

  @override
  void initState() {
    heart = widget.productModel.like_product_id != null ? true : false;

    super.initState();
  }

  Widget buildPage(String path) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.6,
        // height: MediaQuery.of(context).size.width * 0.6,
        child: Image.network(
          path != null
              ? AppConstants.BASE_URL + "/" + path
              : AppConstants.BASE_URL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contentController = TextEditingController(
      text: "${getTranslated('CONTENTS_HINT', context)}",
    );

    if (widget.isCreateScreen == false) {
      titleController.text = widget.productModel.title;
    } else {
      titleController.text = '';
      contentController.text = '';
      gradeController.text = '0';
    }

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('PRODUCT_DETAIL_INFO', context)}",
              ),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  // decoration: BoxDecoration(color: Colors.white),
                  decoration: BoxDecoration(
                    color: Color(0xffcfcbc3),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        child: PageView(
                          children: thumbnailItems,
                          controller: _controller,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ScrollingPageIndicator(
                        dotColor: Colors.grey,
                        dotSelectedColor: Colors.deepPurple,
                        dotSize: 6,
                        dotSelectedSize: 8,
                        dotSpacing: 18,
                        controller: _controller,
                        itemCount: thumbnailItems.length == 0
                            ? 1
                            : thumbnailItems.length,
                        orientation: Axis.horizontal,
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            // margin: const EdgeInsets.all(8.0),
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100.0)),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                  child: Text(
                                    "${widget.productModel.tag}",
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                    "${widget.productModel.title}",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Text(
                                    "${PriceConverter.convertPrice(context, widget.productModel.price.toDouble())} ${getTranslated('WON', context)}" ??
                                        '${widget.productModel.price} ${getTranslated('WON', context)}',
                                    style: TextStyle(
                                      color: Color(0xFF0123B4),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 0, 5),
                                  child: Text(
                                    "${getTranslated('PRODUCT_DETAIL_PRODUCT_DESC', context)}",
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: Dimensions
                                        .PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 4, 0),
                                  child: Center(
                                    child: Text(
                                      "${widget.productModel.description}",
                                      style: TextStyle(
                                        color: Color(0xFF333333),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 12, 0),
                                      child: Card(
                                        child: Container(
                                          height: 35,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${getTranslated('AMOUNT', context)}",
                                                  style: TextStyle(
                                                    color: Color(0xFF999999),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              _itemCount != 0
                                                  ? IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () => setState(
                                                          () => _itemCount--),
                                                    )
                                                  : IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: null,
                                                    ),
                                              Text(_itemCount.toString()),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                ),
                                                onPressed: () => setState(
                                                    () => _itemCount++),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 25, 0, 0),
                                      child: CustomDropdownButton2(
                                        hint:
                                            '${getTranslated('PRODUCT_DETAIL_PRODUCT_OPTION_DESC', context)}',
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                        dropdownItems: optionDropdownItems,
                                        value: optionDropdownItems.length != 0
                                            ? optionDropdownItems[
                                                optionDropdownValue]
                                            : null,
                                        onChanged: (value) {
                                          setState(() {
                                            optionDropdownValue =
                                                optionDropdownItems
                                                    .indexOf(value);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 25, 0),
                                      child: Text(
                                        "${getTranslated('DELIVERY_CHARGE', context)}",
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 6, 15, 5),
                                      child: Text(
                                        "${getTranslated('PLUS', context)}${PriceConverter.convertPrice(context, widget.productModel.delivery_fee.toDouble())} ${getTranslated('WON', context)}",
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 5,
                                  thickness: 1,
                                  indent: 12,
                                  endIndent: 12,
                                  color: Color(0xffdddddd),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 0),
                                      child: Text(
                                        "${getTranslated('FINAL_PAYMENT_AMOUNT', context)}",
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 15, 10),
                                      child: Text(
                                        "${_itemCount == 0 ? 0 : PriceConverter.convertPrice(context, widget.productModel.price * _itemCount + widget.productModel.delivery_fee.toDouble())} ${getTranslated('WON', context)}",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: Dimensions
                                        .PADDING_SIZE_EXTRA_EXTRA_SMALL),
                                CustomElevatedButton(
                                  onTap: () async {
                                    OrderModel orderModel = OrderModel(
                                      image1:
                                          widget.productModel.thumbnail != null
                                              ? AppConstants.BASE_URL +
                                                  "/" +
                                                  widget.productModel.thumbnail
                                              : AppConstants.BASE_URL,
                                      title: widget.productModel.title,
                                      option: optionDropdownItems.length != 0
                                          ? optionDropdownItems[
                                              optionDropdownValue]
                                          : null,
                                      quantity: _itemCount,
                                      price: widget.productModel.price,
                                      delivery_fee:
                                          widget.productModel.delivery_fee,
                                      total_fee: widget.productModel.price *
                                              _itemCount +
                                          widget.productModel.delivery_fee,
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => ProductShippingPage(
                                            orderModel: orderModel,
                                        ),
                                      ),
                                    );
                                  },
                                  buttonText:
                                      "${getTranslated('GO_TO_ORDER', context)}",
                                ),
                                SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                ),
                                for (var item in detailItems)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 0, 15, 25),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        child: Image.network(
                                          // widget.reviewModel.attachedFilepath1,
                                          // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                          item != null
                                              ? AppConstants.BASE_URL +
                                                  "/" +
                                                  item
                                              : AppConstants.BASE_URL,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 30,
                            child: InkWell(
                              onTap: () {
                                var userId =
                                    Provider.of<AuthProvider>(context, listen: false)
                                    .getUser()["id"];

                                if (userId != null) {
                                  LikeProductModel likeProductModel = LikeProductModel(
                                    id: widget.productModel.like_product_id,
                                    user_id: userId,
                                    product_id: widget.productModel.id,
                                  );

                                  if (heart)
                                    Provider.of<LikeProductProvider>(context,
                                      listen: false)
                                      .deleteLikeProduct(likeProductModel);
                                else
                                  Provider.of<LikeProductProvider>(context,
                                    listen: false)
                                    .addLikeProduct(likeProductModel);

                                setState(() {
                                  heart = !heart;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                content: Text("${getTranslated('LOGIN_FAVORITE_REGISTERING', context)}"),
                                backgroundColor: Colors.red),
                                );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Color(0xfff8f8f8),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffbbbbbb),
                                        offset: const Offset(0.0, 2.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      )
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    child: Image.asset(
                                      heart
                                          ? Images.heart_fill
                                          : Images.heart,
                                      fit: BoxFit.cover,
                                      width: 20,
                                      // width: MediaQuery.of(context).size.width * 0.9,
                                      // height: MediaQuery.of(context).size.width * 0.9,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
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
