/* 챌린지 디테일 페이지 */

import 'package:pistachio/view/page/challenge/detail/widget.dart';
import 'package:pistachio/model/class/challenge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// class
class ChallengeDetailPage extends StatelessWidget {
  const ChallengeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Challenge challenge = Get.arguments;

    return Scaffold(
      appBar: const ChallengeDetailAppBar(),
      backgroundColor: challenge.theme['background'],
      body: const ChallengeListView(),
    );
  }
}