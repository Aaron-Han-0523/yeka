import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/community_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/community_freeboard_provider.dart';
import '../../../provider/community_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../util//app_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/textarea/custom_textarea.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import 'community_free_board_list_screen.dart';

class CommunityUpdateScreen extends StatefulWidget {
  final CommunityModel communityModel;

  const CommunityUpdateScreen({Key key, this.communityModel}) : super(key: key);

  @override
  State<CommunityUpdateScreen> createState() => _CommunityUpdateScreenState();
}

class _CommunityUpdateScreenState extends State<CommunityUpdateScreen> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _linkController = TextEditingController();

  List<ImageModel> imageList = [];
  List<String> items = [];
  String path;
  String name;
  bool set = true;
  List<Media> res;

  Future<void> _loadData(BuildContext context, bool reload) async {
    name = Provider.of<AuthProvider>(context, listen: false).getUser()["name"];

    _titleController.text = widget.communityModel.community_title ?? "";
    _contentController.text = widget.communityModel.community_content ?? "";
    _linkController.text = widget.communityModel.community_link ?? "";

    if (widget.communityModel.id != null) {
      ImageModel imageModel =
          ImageModel(community_id: widget.communityModel.id);
      await Provider.of<CustomImageProvider>(context, listen: false)
          .getImageListByCommunityId(imageModel);

      imageList = await Provider.of<CustomImageProvider>(context, listen: false)
          .imageList;
    }
  }

  Widget buildPage(String url) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: FadeInImage.assetNetwork(
          placeholder: Images.placeholder1,
          image: url != null
              ? AppConstants.BASE_URL + "/" + url
              : AppConstants.BASE_URL,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.28,
          height: MediaQuery.of(context).size.width * 0.28,
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, true);
  }

  @override
  Widget build(BuildContext context) {
    if (set) {
      Timer(Duration(seconds: 1), () {
        setState(() {
          items;
          for (var i = 0; i < imageList.length; i++) {
            items.add(imageList[i].path);
          }
        });
      });

      set = false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              CustomSliverAppBar(
                "${getTranslated('UPDATE_BOARD', context)}",
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
                    Consumer<CommunityFreeBoardProvider>(
                        builder: (context, communityProvider, child) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: InkWell(
                                onTap: () async {
                                  res = await ImagesPicker.pick(
                                    count: 5,
                                    pickType: PickType.image,
                                    language: Language.System,
                                    maxTime: 30,
                                    // maxSize: 500,
                                    cropOpt: CropOption(
                                      // aspectRatio: CropAspectRatio.wh16x9,
                                      cropType: CropType.circle,
                                    ),
                                  );
                                  if (res != null) {
                                    print(res.map((e) => e.path).toList());

                                    setState(() {
                                      if (items.length < 5) {
                                        items = res
                                            .map((e) => e.thumbPath)
                                            .toList();
                                      }
                                    }
                                    );
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
                                          "${items.length ?? 0}${getTranslated('PICTURE_MAX_LENGTH', context)}",
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
                            for (var i = 0; i < items.length; i++)
                              Image.file(
                                File(items[i]),
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder1,
                                    image: items[i] != null
                                        ? AppConstants.BASE_URL + "/" + items[i]
                                        : AppConstants.BASE_URL,
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    imageErrorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace stackTrace) {
                                      return Container(
                                        // padding: const EdgeInsets.all(10.0),
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xfff1f1f1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            Images.upload,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            for (var i = items.length; i < 5; i++)
                              Container(
                                // padding: const EdgeInsets.all(10.0),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xfff1f1f1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(
                                    Images.upload,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
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
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      child: CustomElevatedButton(
                        onTap: () async {
                          modify();
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => CommunityFreeBoardListScreen(),
                            ),
                          );
                        },
                        buttonText: "${getTranslated('CONFIRMATION', context)}",
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
      ),
    );
  }

  modify() async {
    // 이미지 삭제
    if (res != null) {
      for (var i = 0; i < imageList.length; i++) {
        ImageModel imageModel = ImageModel(
          id: imageList[i].id,
        );

        await Provider.of<CustomImageProvider>(context, listen: false)
            .deleteImage(imageModel);
      }
    }

    CommunityModel communityModel = CommunityModel(
      id: widget.communityModel.id,
      community_type: widget.communityModel.community_type,
      community_title: _titleController.text,
      community_content: _contentController.text,
      community_link: _linkController.text,
      views: widget.communityModel.views,
      writer: name,
      update_date: DateConverter.formatDate(DateTime.now()),
    );

    await Provider.of<CommunityProvider>(context, listen: false)
        .updateCommunity(communityModel);

    // 프로필
    for (var i = 0; i < items.length; i++) {
      ImageModel imageModel = ImageModel(
        id: widget.communityModel.id,
        community_id: widget.communityModel.id,
        title: _titleController.text,
        content: _contentController.text,
        path: items[i],
        image_type: 7,
        create_date: DateConverter.formatDate(DateTime.now()),
        update_date: DateConverter.formatDate(DateTime.now()),
      );

      await Provider.of<CustomImageProvider>(context, listen: false)
          .addImage(imageModel);
    }
  }
}
