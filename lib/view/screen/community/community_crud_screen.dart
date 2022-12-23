import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/helper/date_converter.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';

import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../data/model/response/community_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/community_provider.dart';
import '../../../provider/image_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/textarea/custom_textarea.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import 'package:images_picker/images_picker.dart';

class CommunityCRUDScreen extends StatefulWidget {
  final CommunityModel communityModel;

  const CommunityCRUDScreen({Key key, this.communityModel}) : super(key: key);

  @override
  State<CommunityCRUDScreen> createState() => _CommunityCRUDScreenState();
}

class _CommunityCRUDScreenState extends State<CommunityCRUDScreen> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _linkController = TextEditingController();

  List<String> thumbnailLists = [];
  String path;
  String name;

  Future<void> _loadData(BuildContext context, bool reload) async {
    name = Provider.of<AuthProvider>(context, listen: false).getUser()["name"];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('WRITE_BOARD', context)}",
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xffeeeeee),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 4),
                        child: Row(
                          children: [
                            Text(
                              "${getTranslated('PICTURE', context)}",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 3, 0, 0),
                              child: Text(
                                "${getTranslated('ROUND_BRACKETS_SELECT', context)}",
                                style: TextStyle(
                                    fontSize: 9.0,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff999999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                        child: Container(
                          width: 500,
                          child: Text(
                            "${getTranslated('UPLOAD_PICTURE', context)}",
                            style: TextStyle(
                              fontSize: 8.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: InkWell(
                                onTap: () async {
                                  thumbnailLists = [];

                                  List<Media> res = await ImagesPicker.pick(
                                    count: 5,
                                    pickType: PickType.all,
                                    language: Language.System,
                                    maxTime: 30,
                                    // maxSize: 500,
                                    cropOpt: CropOption(
                                      // aspectRatio: CropAspectRatio.wh16x9,
                                      cropType: CropType.circle,
                                    ),
                                  );
                                  print(res);
                                  if (res != null) {
                                    print(res.map((e) => e.path).toList());

                                    setState(() {
                                      thumbnailLists =
                                          res.map((e) => e.thumbPath).toList();
                                    });
                                    // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                                    // print(status);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            11.5,
                                            11.5,
                                            11.5,
                                            20.0,
                                          ),
                                          width: 55,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xfff1f1f1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Image.asset(
                                            Images.upload,
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "${thumbnailLists.length ?? 0}${getTranslated('PICTURE_MAX_LENGTH', context)}",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Color(0xff999999),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            for (var i = 0; i < thumbnailLists.length; i++)
                              Image.file(
                                File(thumbnailLists[i]),
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                              ),
                            for (var i = thumbnailLists.length; i < 5; i++)
                              Container(
                                padding: const EdgeInsets.fromLTRB(
                                  11.5,
                                  11.5,
                                  11.5,
                                  20.0,
                                ),
                                width: 55,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Color(0xfff1f1f1),
                                ),
                                child: Image.asset(
                                  Images.upload,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomLabelTextField(
                        controller: _titleController,
                        labelText: "${getTranslated('TITLE', context)}",
                        label_fontSize: 12,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('INPUT_TITLE', context)}",
                        hintSize: 9,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomTextarea(
                        textEditingController: _contentController,
                        labelText: "${getTranslated('CONTENT', context)}",
                        hintText: "",
                        hintSize: 9,
                        enabled: true,
                        label_fontSize: 12,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomLabelTextField(
                        controller: _linkController,
                        labelText: "${getTranslated('MOVIE_LINK', context)}",
                        label_fontSize: 12,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('LINK', context)}",
                        hintSize: 9,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomElevatedButton(
                          onTap: () async {
                            CommunityModel communityModel = CommunityModel(
                              community_type: widget.communityModel.community_type,
                              community_title: _titleController.text,
                              community_content: _contentController.text,
                              community_link: _linkController.text,
                              views: 0,
                              writer: name,
                              create_date: DateConverter.formatDate(DateTime.now()),
                            );

                            communityModel = await Provider.of<CommunityProvider>(context, listen: false).addCommunity(communityModel);

                            for (var i = 0; i < thumbnailLists.length; i++) {
                              ImageModel imageModel = ImageModel(
                                community_id: communityModel.id,
                                path: thumbnailLists[i],
                                create_date: DateConverter.formatDate(DateTime.now()),
                              );

                              Provider.of<CustomImageProvider>(context, listen: false).addImage(imageModel);
                            }
                          },
                          buttonText:
                              "${getTranslated('CONFIRMATION', context)}",
                          fontSize: 10,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),

                      FooterPage(),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
