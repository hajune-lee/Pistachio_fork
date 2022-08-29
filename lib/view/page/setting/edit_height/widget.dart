/* 신장 수정 페이지 위젯 */

import 'package:pistachio/global/theme.dart';
import 'package:pistachio/presenter/page/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditHeightAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: [
        GetBuilder<SettingPresenter>(
          builder: (controller) {
            return IconButton(
              icon: Icon(
                Icons.check,
                color: colorScheme.primary,
              ),
              onPressed: controller.heightSubmitted,
            );
          },
        ),
      ],
    );
  }
}

class HeightTextField extends StatelessWidget {
  const HeightTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPresenter>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 8.0),
                      child: Text(
                        "신장",
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    TextFormField(
                      controller: SettingPresenter.heightCont,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: '신장을 입력하세요',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            //padding: const EdgeInsets.all(.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: colorScheme.surface,
                                border: Border.all(
                                    width: 2
                                )
                            ),
                            child: IconButton(
                                onPressed: SettingPresenter.heightCont.clear,
                                icon: Icon(Icons.clear,
                                    color: colorScheme.onSurfaceVariant)
                              /*CircleAvatar(
                              backgroundColor: colorScheme.surface,
                              radius: 100,
                              child: Icon(Icons.clear,
                              color: colorScheme.onSurfaceVariant),
                              ),*/
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorScheme.outline),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(color: colorScheme.outline),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '상태메세지를 입력하세요';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
}