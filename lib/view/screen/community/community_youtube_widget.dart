import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/images.dart';
import '../../../data/model/response/community_model.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/youtube_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/community_youtube_provider.dart';
import 'community_youtube_detail_screen.dart';

class CommunityYoutubeWidget extends StatefulWidget {
  final CommunityModel communityModel;

  CommunityYoutubeWidget({@required this.communityModel});

  @override
  State<CommunityYoutubeWidget> createState() => _CommunityYoutubeWidgetState();
}

class _CommunityYoutubeWidgetState extends State<CommunityYoutubeWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        CommunityModel latestCommunityModel =
            await Provider.of<CommunityYoutubeProvider>(context, listen: false)
                .getCommunity(widget.communityModel);
        latestCommunityModel.views = latestCommunityModel.views + 1;

        Provider.of<CommunityYoutubeProvider>(context, listen: false)
            .updateCommunity(latestCommunityModel);
        final value = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunityYoutubeDetailScreen(
                communityModel: latestCommunityModel),
          ),
        ).then((value) {

        });

        print(value);

        setState(() {
          color = color == Colors.white ? Colors.grey : Colors.white;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color(0xffEEEEEE)
                )
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.communityModel.community_title,
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${widget.communityModel.writer ?? "${getTranslated('YEKA', context)}"}",
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff999999),
                              ),
                            ),
                            Text(
                              "${getTranslated('|', context)}",
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff999999),
                              ),
                            ),
                            Text(
                              "${widget.communityModel.create_date != null ? DateConverter.fromNowDuration(widget.communityModel.create_date) : ""}",
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.eye1,
                              fit: BoxFit.cover,
                              width: 12,
                            ),
                            Text(
                              " ${widget.communityModel.views}${getTranslated('TIMES', context)}",
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff999999),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 82,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder1,
                  image: YoutubeConverter.getYoutubeThumbnail(
                    "${widget.communityModel.community_link}",
                  ),
                  fit: BoxFit.fitWidth,
                  height: 49,
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace stackTrace) {
                    return Image.asset(
                      Images.placeholder1,
                      fit: BoxFit.fitHeight,
                      height: 49,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
