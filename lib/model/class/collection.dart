/* 컬렉션 모델 구조 */
class Collection {
  /// attributes
  String? id;
  String? title;
  String? imageUrl;
  String? description;

  /// constructors
  Collection();

  Collection.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  /// methods
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['imageUrl'] = imageUrl;
    json['description'] = description;
    return json;
  }
}