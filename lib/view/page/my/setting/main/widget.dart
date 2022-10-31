
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pistachio/global/theme.dart';
import 'package:pistachio/presenter/model/badge.dart';
import 'package:pistachio/presenter/model/user.dart';
import 'package:pistachio/presenter/page/collection/main.dart';
import 'package:pistachio/presenter/page/my/setting/edit.dart';
import 'package:pistachio/presenter/page/my/setting/main.dart';
import 'package:pistachio/view/widget/button/button.dart';
import 'package:pistachio/view/widget/widget/badge.dart';
import 'package:pistachio/view/widget/widget/text.dart';

class MySettingMainView extends StatelessWidget {
  const MySettingMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            MyProfileUpdateButtonWidget(),
            SizedBox(height: 50.0),
            EditFieldView(),
            SizedBox(height: 120.0),
            AccountButtonView(),
          ],
        ),
      ),
    );
  }
}

class MyProfileUpdateButtonWidget extends StatefulWidget {
  const MyProfileUpdateButtonWidget({Key? key}) : super(key: key);

  @override
  State<MyProfileUpdateButtonWidget> createState() => _MyProfileUpdateButtonWidgetState();
}

class _MyProfileUpdateButtonWidgetState extends State<MyProfileUpdateButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final userP = Get.find<UserPresenter>();
    String? badgeId = userP.loggedUser.badgeId;

    return Column(
      children: [
        BadgeWidget(badge: BadgePresenter.getBadge(badgeId), size: 100.0),
        const SizedBox(height: 10.0),
        PTextButton(
          text: '뱃지 변경',
          onPressed: () async {
            if (await CollectionMain.toCollectionMain()) setState(() {});
          },
          action: const Icon(Icons.add_photo_alternate_outlined),
        ),
      ],
    );
  }
}

class EditFieldView extends StatelessWidget {
  const EditFieldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        EditTextField(editType: 'nickname'),
        SizedBox(height: 30.0),
        EditTextField(editType: 'height'),
        SizedBox(height: 30.0),
        EditTextField(editType: 'weight'),
      ],
    );
  }
}


class EditTextField extends StatelessWidget {
  const EditTextField({Key? key, required this.editType}) : super(key: key);

  final String editType;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPresenter>(
      builder: (controller) {
        Map<String, String> value = {
          'nickname': controller.loggedUser.nickname!,
          'height': '${controller.loggedUser.height} cm',
          'weight': '${controller.loggedUser.weight} kg',
        };

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PText(MySettingEdit.kr[editType]!, style: textTheme.headlineSmall),
            const SizedBox(height: 10.0),
            Material(
              color: PTheme.white,
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                onTap: () => MySettingEdit.toMySettingEdit(editType),
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: PTheme.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: PText(value[editType]!,
                    style: textTheme.titleMedium,
                    color: PTheme.grey,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AccountButtonView extends StatelessWidget {
  const AccountButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LogoutButton(),
        AccountDeleteButton(),
      ],
    );
  }
}


class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PButton(
      onPressed: MySettingMain.logoutButtonPressed,
      fill: false, border: false,
      child: PText('로그아웃', style: textTheme.titleLarge),
    );
  }
}

class AccountDeleteButton extends StatelessWidget {
  const AccountDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const PButton(
    //   text: '계정 삭제하기',
    //   onPressed: MySettingMain.accountDeleteButtonPressed,
    //   stretch: true,
    //   backgroundColor: Colors.red,
    // );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: MySettingMain.accountDeleteButtonPressed,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PText('계정 탈퇴',
            style: const TextStyle(fontFamily: 'Noto Sans KR'),
            color: PTheme.grey,
          ),
        ),
      ),
    );
  }
}