/* 챌린지 완료 위젯 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/model/class/database/party.dart';
import 'package:pistachio/presenter/global.dart';
import 'package:pistachio/presenter/page/challenge/party/main.dart';
import 'package:pistachio/view/widget/button/button.dart';
import 'package:pistachio/view/widget/effect/effect.dart';
import 'package:pistachio/view/widget/widget/badge.dart';
import 'package:pistachio/view/widget/widget/text.dart';
import 'package:pistachio/view/widget/widget/card.dart';

// 챌린지 완료 리스트 뷰
class ChallengePartyCompleteView extends StatelessWidget {
  const ChallengePartyCompleteView({
    Key? key,
    required this.party,
  }) : super(key: key);

  final Party party;

  @override
  Widget build(BuildContext context) {
    final challengePartyMain = Get.find<ChallengePartyMain>();

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              party.challenge!.imageUrls['complete'],
              fit: BoxFit.fitHeight,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        Positioned.fill(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 180.0.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 36.0.w),
                  child: PCard(
                    color: PTheme.background,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PText('${party.challenge!.title!}\n완료!',
                          align: TextAlign.center,
                          style: textTheme.headlineLarge,
                          color: PTheme.black,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20.0),
                        PText(
                          '난이도: ${party.difficulty.kr}',
                          align: TextAlign.center,
                          style: textTheme.labelLarge,
                          color: PTheme.black,
                          maxLines: 10,
                        ),
                        const SizedBox(height: 30.0),
                        PText(
                          party.challenge!.descriptions['complete']!
                              .replaceAll('##', party.challenge!.word),
                          align: TextAlign.center,
                          style: textTheme.labelLarge,
                          color: PTheme.black,
                          maxLines: 10,
                        ),
                        const SizedBox(height: 10.0),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            EternalRotation(
                              rps: .3,
                              child: Image.asset(
                                GlobalPresenter.effectAsset,
                                width: 150.0.r,
                                height: 150.0.r,
                              ),
                            ),
                            BadgeWidget(badge: party.badge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 36.0.w),
              child: PButton(
                onPressed: challengePartyMain.complete,
                text: '보상 받기',
                stretch: true,
              ),
            ),
            SizedBox(height: 70.0.h),
          ],
        ),
      ],
    );
  }
}