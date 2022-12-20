import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/utill/images.dart';
import '../../../data/model/response/community_model.dart';
import '../../../helper/date_converter.dart';
import '../../../helper/youtube_thumbnail_converter.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/community_freeboard_provider.dart';
import 'community_free_board_detail_screen.dart';
import 'community_youtube_detail_screen.dart';

class CommunityFreeBoardWidget extends StatelessWidget {
  final CommunityModel communityModel;

  CommunityFreeBoardWidget({@required this.communityModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //fixme 조회수 증가하는 부분인데 정확한 타이밍은 화면 보면서 확인할 것
        CommunityModel latestCommunityModel = await Provider.of<CommunityFreeBoardProvider>(context, listen: false).getCommunity(communityModel);
        latestCommunityModel.views =  latestCommunityModel.views + 1;

        Provider.of<CommunityFreeBoardProvider>(context, listen: false).updateCommunity(latestCommunityModel);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommunityFreeBoardDetailScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 83,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                // widget.reviewModel.attachedFilepath1,
                // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                // communityModel.community_link != null
                //     ? YoutubeThumbnailConverter.getYoutubeThumbnail(
                //         "${communityModel.community_link}",
                //       )
                //     :
                YoutubeThumbnailConverter.getYoutubeThumbnail(
                  "https://www.youtube.com/watch?v=-QhZnyAgKZk",
                ),
                fit: BoxFit.fitWidth,
                width: 30,
                height: 49,
                // height: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ),
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
                      Row(
                        children: [
                          Image.asset(
                            Images.eye1,
                            fit: BoxFit.cover,
                            width: 12,
                          ),
                          Text(
                            //FIXME 테이블에 count 필드 추가해야함
                            // "723회",
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
