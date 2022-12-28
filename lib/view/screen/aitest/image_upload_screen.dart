import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../util//images.dart';
import 'ox_screen.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage>
    with TickerProviderStateMixin {
  List<String> thumbnailLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("${getTranslated('AI_TEST', context)}"),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff333333),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "AI TEST",
                                        style: TextStyle(
                                          fontSize: 72,
                                          color: Color(0xff444444),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 5,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            Container(
                                              child: Text(
                                                "${getTranslated('PLEASE_UPLOAD_PICTURE', context)}",
                                                style: TextStyle(
                                                  fontSize: 26,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "${getTranslated('FRONT_PICTURE', context)}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffFFFFFF),
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${getTranslated('CORRECT_PICTURE', context)}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffFFFFFF),
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Stack(children: [
                              Container(
                                margin: EdgeInsets.only(top: 220),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(50.0),
                                  ),
                                  color: Color(0xffffffff),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 141,
                              ),
                              Container(
                                height: 360,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 30),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: BoxDecoration(
                                            // border: Border.all(
                                            //   width: 2,
                                            //   color: Color(0XFF2434D7),
                                            // ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            color: Color(0xffF1F1F1),
                                          ),
                                          child: Center(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Image.asset(
                                                  Images.help,
                                                  width: 23,
                                                ),
                                              ),
                                              Text(
                                                "${getTranslated('REGISTRATION_IMAGE', context)}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ))),
                                    )),
                              ),
                            ]),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16.0,
                          0.0,
                          16.0,
                          16.0,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              thumbnailLists = [];

                              List<Media> res = await ImagesPicker.pick(
                                count: 1,
                                pickType: PickType.all,
                                language: Language.System,
                                maxTime: 30,
                                // maxSize: 500,
                                cropOpt: CropOption(
                                  // aspectRatio: CropAspectRatio.wh16x9,
                                  cropType: CropType.circle,
                                ),
                              );

                              if (res != null) {
                                setState(() {
                                  thumbnailLists =
                                      res.map((e) => e.thumbPath).toList();
                                });
                              }

                              if (thumbnailLists.length > 0) {
                                ConsultingModel consultingModel =
                                    ConsultingModel(
                                  client_image: thumbnailLists[0],
                                  create_date:
                                      DateConverter.formatDate(DateTime.now()),
                                );

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => OXPage(
                                          consultingModel: consultingModel,
                                      ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff121212),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.cloud,
                                      height: 38,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        "${getTranslated('START', context)}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "SB Aggro",
                                          // fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
