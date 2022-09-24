class Level {
  /// attributes
  String? id;
  String? title;
  int? amount;
  String? description;
  String? imageUrl;

  /// constructors
  Level();

  Level.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  /// methods
  void fromJson(Map<String, dynamic> json) {
    id = '${json['id']}';
    title = '${json['title']}';
    amount = json['amount'];
    description = json['description'];
    imageUrl = idToImageUrl(id!);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = int.parse(json['id']);
    json['title'] = title;
    json['amount'] = amount;
    json['description'] = description;
    return json;
  }

  /// static variables
  static String asset = 'assets/image/level/';

  /// static methods
  static String idToImageUrl(String id) => '$asset$id.svg';
}