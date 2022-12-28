import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/images.dart';
import '../../../data/model/response/community_model.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/youtube_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/community_youtube_provider.dart';
import 'community_youtube_detail_screen.dart';

class CommunityYoutubeWidget extends StatelessWidget {
  final CommunityModel communityModel;

  CommunityYoutubeWidget({@required this.communityModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        CommunityModel latestCommunityModel =
            await Provider.of<CommunityYoutubeProvider>(context, listen: false)
                .getCommunity(communityModel);
        latestCommunityModel.views = latestCommunityModel.views + 1;

        Provider.of<CommunityYoutubeProvider>(context, listen: false)
            .updateCommunity(latestCommunityModel);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunityYoutubeDetailScreen(
                communityModel: latestCommunityModel),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    communityModel.community_title,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${communityModel.writer ?? "${getTranslated('YEKA', context)}"}",
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
                            "${communityModel.create_date != null ? DateConverter.fromNowDuration(communityModel.create_date) : ""}",
                            // "7일전",
                            style: TextStyle(
                              fontSize: 7.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.eye1,
                              fit: BoxFit.cover,
                              width: 12,
                            ),
                            Text(
                              "${communityModel.views}${getTranslated('TIMES', context)}",
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff999999),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  "${communityModel.community_link}",
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
    );
  }
}
