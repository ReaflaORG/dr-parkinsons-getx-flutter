class WelfareModel {
  int welfare_id;
  String title;
  String image;
  String description;
  DateTime created_at;
  DateTime updated_at;

  WelfareModel({
    required this.welfare_id,
    required this.title,
    required this.image,
    required this.description,
    required this.created_at,
    required this.updated_at,
  });

  WelfareModel.fromJson(json)
      : this(
          welfare_id:
              json['welfare_id'] != null ? json['welfare_id'] as int : 0,
          title: json['title'] != null ? json['title'] as String : '',
          image: json['image'] != null ? json['image'] as String : '',
          description:
              json['description'] != null ? json['description'] as String : '',
          created_at: DateTime.parse(json['created_at']),
          updated_at: DateTime.parse(json['updated_at']),
        );

  Map<String, dynamic> toJson() {
    return {
      'welfare_id': welfare_id,
      'title': title,
      'image': image,
      'description': description,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
    };
  }
}
