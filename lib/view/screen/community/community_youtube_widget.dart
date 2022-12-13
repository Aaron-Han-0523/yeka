import 'package:flutter/material.dart';
import 'package:yeka/utill/images.dart';
import '../../../data/model/response/community_model.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import 'community_youtube_detail_screen.dart';

class CommunityYoutubeWidget extends StatelessWidget {
  final CommunityModel communityModel;

  CommunityYoutubeWidget({@required this.communityModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunityYoutubeDetailScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    // titleList[position],
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${communityModel.writer ?? "BYHER(바이허)"}",
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
                        "${DateConverter.fromNowDuration(communityModel.create_date)}",
                        // "7일전",
                        style: TextStyle(
                          fontSize: 7.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff999999),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(158, 0, 0, 0),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.eye1,
                              fit: BoxFit.cover,
                              width: 12,
                            ),
                            Text(
                              //FIXME 테이블에 count 필드 추가해야함
                              // "723회",
                              "723회",
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
            Container(
              width: 82,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  YoutubeThumbnailConverter.getYoutubeThumbnail(
                    "https://www.youtube.com/watch?v=-QhZnyAgKZk",
                  ),
                  // communityModel.community_link != null
                  //     ? YoutubeThumbnailConverter.getYoutubeThumbnail(
                  //         "${communityModel.community_link}",
                  //       )
                  //     :
                  fit: BoxFit.fitWidth,
                  width: 165,
                  height: 49,
                  // height: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
