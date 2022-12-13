import 'package:flutter/material.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:provider/provider.dart';
import '../../../data/model/response/product_model.dart';
import '../../../provider/product_provider.dart';
import 'product_detail_screen.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  ProductWidget({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // productModel.custom1 =
        //     (int.parse(productModel.custom1 ?? "0") + 1).toString();
        // reviewModel.carInfo_id = 1;

        Provider.of<ProductProvider>(context, listen: false)
            .updateProduct(productModel);

        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (context, anim1, anim2) => ProductDetailPage(
                productModel: productModel, isCreateScreen: false),
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
                    image: AppConstants.BASE_URL +
                        "/" +
                        (productModel.title ?? ""),
                    // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                    //     '/${bannerProvider.mainBannerList[index].photo}',
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
                    Images.heart,
                    height: 20,
                    fit: BoxFit.fitHeight,
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
                        productModel.tag,
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
                  '[블랑]비비크림',
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
                        productModel.title ?? '마르지 않는 피부의 비밀마르지안는',
                        textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(
                          fontSize: 7,
                          fontWeight: FontWeight.bold,
                        ),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${productModel.price}" ?? '25,000원',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
