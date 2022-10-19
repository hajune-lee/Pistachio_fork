import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/view/page/my/record/widget.dart';
import 'package:pistachio/view/widget/widget/app_bar.dart';
import '../../../../model/enum/enum.dart';

class MyRecordPage extends StatelessWidget {
  const MyRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.arguments == null) return const Scaffold();
    ActivityType type = Get.arguments;

    return Scaffold(
      backgroundColor: PTheme.background,
      appBar: const PAppBar(),
      body: MyRecordDetailView(type: type),
    );
  }
}