/* 사용자 모델 프리젠터 */

import 'package:get/get.dart';
import 'package:pistachio/model/user.dart';
import 'package:pistachio/presenter/firebase/firebase.dart';

/// class
class UserPresenter extends GetxController {
  /// attributes
  /* 로그인 관련 */
  // User Credential 정보
  Map<String, dynamic> data = {};

  // 현재 로그인된 사용
  PUser loggedUser = PUser();

  // 로그인 여부
  bool get isLogged => loggedUser.uid != null;

  final notifications = <Map<String, dynamic>>[].obs;

  /// methods
  /* 로그인 관련 */
  // 로그인
  // 매개변수로 받은 사용자 정보와 User Credential 정보를 병합하여 현재 로그인된 사용자자 최신화
  void login(PUser user) {
    Map<String, dynamic> json = user.toJson();
    data.forEach((key, value) => json[key] = value);
    loggedUser = PUser.fromJson(json);
  }

  // 로그아웃
  // 현재 로그인된 사용자 정보 초기화
  void logout() {
    loggedUser = PUser();
  }

  /* 파이어베이스 관련 */
  // 파이어베이스에 최신화
  void save() => f.collection('users').doc(loggedUser.uid).set(loggedUser.toJson());

  // 파이어베이스에서 삭제
  void delete() => f.collection('users').doc(loggedUser.uid).delete();
}