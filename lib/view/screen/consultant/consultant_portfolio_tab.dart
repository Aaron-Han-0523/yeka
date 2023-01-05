import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/provider/image_provider.dart';

import '../../../localization/language_constants.dart';
import '../../../util//app_constants.dart';
import '../../../util//dimensions.dart';
import '../../../util//images.dart';
import '../../basewidget/button/custom_elevated_button.dart';

class ConsultantPortfolioWidget extends StatefulWidget {
  const ConsultantPortfolioWidget({
    Key key,
  }) : super(key: key);

  @override
  State<ConsultantPortfolioWidget> createState() =>
      _ConsultantPortfolioWidgetState();
}

class _ConsultantPortfolioWidgetState extends State<ConsultantPortfolioWidget> {
  @override
  Widget build(BuildContext context) {
    int cnt = 0;

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
      ],
    );

    var row;

    for (var image
        in Provider.of<CustomImageProvider>(context, listen: false).imageList) {
      if (image.image_type == 3) {
        if (cnt % 3 == 0) {
          row = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          );
        }

        row.children.add(
          ClipRRect(
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: image != null
                  ? FadeInImage.assetNetwork(
                      placeholder: Images.placeholder1,
                      image: image.path != null
                          ? AppConstants.BASE_URL + "/" + image.path
                          : AppConstants.BASE_URL + "/placeholder_1x1.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.width * 0.28,
                    )
                  : Container(),
            ),
          ),
        );

        if (cnt % 3 == 2) {
          column.children.add(row);
          column.children.add(
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          );
        }

        cnt++;
      }
    }
/*
    column.children.add(
      Padding(
        padding: const EdgeInsets.all(20),
        child: CustomElevatedButton(
          onTap: () {},
          buttonText: '${getTranslated('LOOK_MORE', context)}',
        ),
      ),
    );
*/

    return column;
  }
}
