import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:yeka/util/custom_themes.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/like_product_model.dart';
import '../../../data/model/response/product_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/like_product_provider.dart';
import '../../../provider/product_provider.dart';
import 'product_detail_screen.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel productModel;

  ProductWidget({@required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    bool heart = widget.productModel.like_product_id != null ? true : false;

    return InkWell(
      onTap: () {
        ImageModel imageModel = ImageModel(
          product_id: widget.productModel.id,
        );

        widget.productModel.like_product_id = heart ? 1 : null;

        Provider.of<CustomImageProvider>(context, listen: false)
            .getImageListByProductId(imageModel)
            .then(
              (value) => Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1000),
                  pageBuilder: (context, anim1, anim2) => ProductDetailPage(
                    productModel: widget.productModel,
                    isCreateScreen: false,
                  ),
                ),
              ),
            );
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.7,
        margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.placeholder1,
                    fit: BoxFit.fitHeight,
                    image: widget.productModel.thumbnail != null
                        ? AppConstants.BASE_URL +
                            "/" +
                            widget.productModel.thumbnail
                        : AppConstants.BASE_URL,
                    imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder_3x1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () async {
                    var userId =
                        await Provider.of<AuthProvider>(context, listen: false)
                            .getUser()["id"];

                    if (userId != null) {
                      LikeProductModel likeProductModel = LikeProductModel(
                        id: widget.productModel.like_product_id,
                        user_id: userId,
                        product_id: widget.productModel.id,
                      );

                      if (heart) {
                        await Provider.of<LikeProductProvider>(context,
                                listen: false)
                            .deleteLikeProduct(likeProductModel);
                      } else {
                        await Provider.of<LikeProductProvider>(context,
                                listen: false)
                            .addLikeProduct(likeProductModel);
                      }

                      int user_id =
                          Provider.of<AuthProvider>(context, listen: false)
                              .getUser()["id"];

                      await Provider.of<ProductProvider>(context, listen: false)
                          .getLatestProductList(0, user_id, context,
                              reload: true);

                      setState(() {
                        heart = !heart;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("${getTranslated('NEED_TO_LOGIN_FOR_FAVORITE', context)}"),
                            backgroundColor: Colors.red),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      6.0,
                      2.0,
                      6.0,
                      2.0,
                    ),
                    margin: const EdgeInsets.fromLTRB(
                      6.0,
                      2.0,
                      6.0,
                      2.0,
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Image.asset(
                      heart ? Images.heart_fill : Images.heart,
                      height: 20,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        5.0,
                        2.0,
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        11.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        widget.productModel.tag != null
                            ? widget.productModel.tag
                            : "",
                        style: TextStyle(
                          fontSize: 6,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), // process quotation 실견적 최종견적
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.productModel.title}',
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${PriceConverter.convertPrice(context, widget.productModel.price.toDouble())} ${getTranslated('WON', context)}" ??
                            '0 ${getTranslated('WON', context)}',
                        style: robotoRegular.copyWith(
                          fontSize: 10,
                          color: Color(0xff9d9d9d),
                          fontWeight: FontWeight.bold,
                        ),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
