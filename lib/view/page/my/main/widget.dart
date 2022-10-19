/* 마이 페이지 위젯 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/global/unit.dart';
import 'package:pistachio/model/class/database/collection.dart';
import 'package:pistachio/model/class/database/user.dart';
import 'package:pistachio/model/enum/enum.dart';
import 'package:pistachio/presenter/global.dart';
import 'package:pistachio/presenter/model/collection.dart';
import 'package:pistachio/presenter/model/level.dart';
import 'package:pistachio/presenter/model/user.dart';
import 'package:pistachio/view/widget/widget/badge.dart';
import 'package:pistachio/view/widget/widget/text.dart';

class MyMainView extends StatefulWidget {
  const MyMainView({Key? key}) : super(key: key);

  @override
  State<MyMainView> createState() => _MyMainViewState();
}

class _MyMainViewState extends State<MyMainView> {
  @override
  Widget build(BuildContext context) {
    PUser loggedUser = Get.find<UserPresenter>().loggedUser;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyProfileWidget(),
          const SizedBox(height: 30.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PText('개인 누적 기록치', style: textTheme.headlineSmall),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ActivityType.values.map((type) {
                      int amounts = loggedUser.getAmounts(type);
                      if (type == ActivityType.distance) {
                        amounts = convertDistance(
                          amounts,
                          DistanceUnit.step,
                          DistanceUnit.kilometer,
                        );
                      }

                      Map<String, dynamic> tier =
                          LevelPresenter.getTier(type, amounts);

                      return Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed('/my/record', arguments: type);
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 70.0.w,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            PText(
                                              tier['currentTitle'] ?? '',
                                              maxLines: 2,
                                              style: textTheme.bodySmall,
                                              align: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: PTheme.black,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0)),
                                              child: LinearPercentIndicator(
                                                padding: EdgeInsets.zero,
                                                progressColor: type.color,
                                                backgroundColor:
                                                    Colors.transparent,
                                                percent: tier['percent'] ?? .0,
                                                lineHeight: 18.0,
                                                barRadius:
                                                    const Radius.circular(8.0),
                                                animation: true,
                                                animationDuration: 1000,
                                                curve: Curves.easeInOut,
                                              ),
                                            ),
                                            // PTexts(
                                            //   [tier['nextTitle'] ?? '', '까지'],
                                            //   colors: [
                                            //     type.color,
                                            //     PTheme.black
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60.0,
                                        child: PText(
                                          '${(100 * (tier['percent'] ?? 0)).round()}%',
                                          style: textTheme.headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (!type.active)
                              Positioned.fill(
                                child: Stack(
                                  children: [
                                    Container(
                                      color: PTheme.surface,
                                      alignment: Alignment.center,
                                      child: Icon(Icons.lock, size: 30.0.r),
                                    ),
                                    Container(
                                      color: PTheme.black.withOpacity(.3),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPresenter>(
      builder: (controller) {
        return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BadgeWidget(
                badge: BadgePresenter.getBadge(controller.loggedUser.badgeId),
                size: 100.0,
                onPressed: () {
                  Collection? collection = controller.loggedUser.collection;
                  if (collection == null) return;
                  GlobalPresenter.showCollectionDialog(collection);
                },
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PText(
                    controller.loggedUser.nickname!,
                    style: textTheme.displaySmall,
                  ),
                  PText(
                    '${height}cm | ${weight}kg',
                    style: textTheme.titleLarge,
                    color: PTheme.grey,
                  ),
                ],
              ),
            ]);
      },
    );
  }
}
