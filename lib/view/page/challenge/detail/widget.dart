/* 챌린지 디테일 위젯 */

import 'package:flutter/material.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/model/class/json/challenge.dart';
import 'package:pistachio/presenter/page/challenge/create.dart';
import 'package:pistachio/view/widget/button/button.dart';
import 'package:pistachio/view/widget/widget/text.dart';
import 'package:pistachio/view/widget/widget/card.dart';

// 챌린지 디테일 리스트 뷰
class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({
    Key? key,
    required this.challenge,
  }) : super(key: key);

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Image.asset(
              challenge.imageUrls['default'],
              height: 250.0,
              fit: BoxFit.fitHeight,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        Positioned(
          top: 200.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PCard(
                color: PTheme.background,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PText(challenge.title!,
                      align: TextAlign.center,
                      style: textTheme.headlineLarge,
                      color: PTheme.black,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20.0),
                    PText('14일',
                      align: TextAlign.center,
                      style: textTheme.labelLarge,
                      color: PTheme.black,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 30.0),
                    PText(
                      challenge.descriptions['detail']!.replaceAll('##', challenge.word),
                      align: TextAlign.center,
                      style: textTheme.labelLarge,
                      color: PTheme.black,
                      maxLines: 10,
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50.0,
          child: PButton(
            onPressed: () => ChallengeCreate.toChallengeCreate(challenge),
            text: '챌린지 하러가기',
            stretch: true,
            constraints: const BoxConstraints(maxWidth: 340.0),
          ),
        ),
      ],
    );
  }
}