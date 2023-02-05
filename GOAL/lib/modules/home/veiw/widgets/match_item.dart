import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/constants/utils/size_config.dart';
import 'package:goal/constants/widget/divider_item.dart';
import 'package:goal/constants/widget/space_item.dart';
import 'package:goal/constants/widget/text.dart';
import 'package:goal/modules/home/controller/home_provider.dart';

class MatchItem extends StatefulWidget {
  final HomeProvider provider;
  final String homeTeam, awayTeam, score, matchTime, weekNo, matchStatus;
  final int index;
  final bool isToday;
  const MatchItem({
    Key key,
    this.provider,
    this.homeTeam,
    this.awayTeam,
    this.score,
    this.matchTime,
    this.index,
    this.weekNo,
    this.matchStatus,
    this.isToday,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.appBackgroundColor.withOpacity(0.12),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.whiteColor,
              Color(0xff808080),
            ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          /// match status
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: widget.provider
                    .getMatchStatusColor(widget.matchStatus.toUpperCase()),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: MyText.drawText(
              content: widget.matchStatus.toUpperCase(),
              centered: true,
              fontSize: getFont(15),
              fontColor: MyColors.whiteColor,
            ),
          ),
          SpaceItem(height: getHeight(10)),
          widget.isToday
              ? MyText.drawText(
                  content: 'Today',
                  fontSize: getFont(18),
                  fontColor: MyColors.whiteColor.withOpacity(0.6),
                )
              : const SizedBox(),
          SpaceItem(height: getHeight(5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// home team
                Expanded(
                  child: MyText.drawText(
                    content: widget.homeTeam,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    centered: true,
                    fontSize: getFont(20),
                    fontColor: MyColors.lightPinkColor,
                    bold: true,
                  ),
                ),
                SpaceItem(
                  width: getWidth(5),
                ),

                /// score
                MyText.drawText(
                  content: widget.score,
                  fontSize: getFont(24),
                  centered: true,
                  fontColor: MyColors.whiteColor,
                  bold: true,
                ),
                SpaceItem(
                  width: getWidth(5),
                ),

                /// away team
                Expanded(
                  child: MyText.drawText(
                    content: widget.awayTeam,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    centered: true,
                    fontSize: getFont(20),
                    fontColor: MyColors.lightPinkColor,
                    bold: true,
                  ),
                ),
              ],
            ),
          ),

          SpaceItem(height: getHeight(15)),

          /// match time
          MyText.drawText(
              content: 'Started at ${widget.matchTime}',
              fontSize: getFont(18),
              fontColor: MyColors.whiteColor.withOpacity(0.6),),

          DividerItem(),

          /// pl title and week no.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.drawText(
                          content: 'Premier League',
                          fontSize: getFont(18),
                          fontColor: MyColors.whiteColor,),
                      MyText.drawText(
                          content: widget.weekNo,
                          fontSize: getFont(17),
                          fontColor: MyColors.whiteColor.withOpacity(0.6),),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SpaceItem(height: getHeight(15)),
        ],
      ),
    );
  }
}
