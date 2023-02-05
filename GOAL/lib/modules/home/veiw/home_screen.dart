import 'package:flutter/material.dart';
import 'package:goal/constants/appColors.dart';
import 'package:goal/constants/utils/size_config.dart';
import 'package:goal/constants/widget/image.dart';
import 'package:goal/constants/widget/loading_item.dart';
import 'package:goal/constants/widget/space_item.dart';
import 'package:goal/constants/widget/text.dart';
import 'package:goal/modules/home/controller/home_provider.dart';
import 'package:goal/modules/home/veiw/widgets/match_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        child: _HomeProviderBody(),
      ),
    );
  }
}

class _HomeProviderBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeProviderBodyState();
  }
}

class _HomeProviderBodyState extends State<_HomeProviderBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).connectNetWork();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (_, HomeProvider myProvider, child) {
      return Scaffold(
        backgroundColor: MyColors.appBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PL logo
                MyImage.drawImage(
                  'assets/images/PL logo.png',
                  width: getWidth(180),
                  height: getHeight(75),
                ),

                SpaceItem(height: getHeight(40)),

                myProvider.isMatchesFetching
                    ? LoadingItem()
                    : Flexible(
                        fit: FlexFit.loose,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: myProvider.matchList.length,
                          separatorBuilder: (context, i) {
                            return SpaceItem(height: getHeight(15));
                          },
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                /// matches date
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /// match day
                                    MyText.drawText(
                                      content: myProvider.getMatchDay(i),
                                      fontSize: getFont(24),
                                      fontColor: MyColors.whiteColor,
                                      bold: true,
                                    ),

                                    /// match date
                                    MyText.drawText(
                                      content: myProvider.getMatchDate(i),
                                      fontSize: getFont(18),
                                      fontColor:
                                          MyColors.whiteColor.withOpacity(0.6),
                                    ),
                                  ],
                                ),

                                /// matches listView
                                ListView.separated(
                                  padding: EdgeInsets.only(top: getHeight(13)),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      myProvider.matchList[i].matches.length,
                                  separatorBuilder: (context, x) {
                                    return SpaceItem(height: getHeight(25));
                                  },
                                  itemBuilder: (context, x) {
                                    return MatchItem(
                                        provider: myProvider,
                                        index: x,
                                        homeTeam: myProvider.matchList[i]
                                            .matches[x].homeTeam.shortName,
                                        awayTeam: myProvider.matchList[i]
                                            .matches[x].awayTeam.shortName,
                                        score: myProvider.getMatchScore(i, x),
                                        matchTime:
                                            myProvider.getMatchStartTime(i, x),
                                        matchStatus: myProvider
                                            .matchList[i].matches[x].status,
                                        weekNo:
                                            'Week ${myProvider.matchList[i].matches[x].matchday}',
                                        isToday:
                                            myProvider.isMatchTodayOrNot(i));
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
