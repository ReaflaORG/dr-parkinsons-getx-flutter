class ParkinsonPostModel {
  int idx;
  String title;
  String image;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  ParkinsonPostModel({
    required this.idx,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  ParkinsonPostModel.fromJson(json)
      : this(
          idx: json['parkinson_post_id'] != null
              ? json['parkinson_post_id'] as int
              : 0,
          title: json['title'] != null ? json['title'] as String : '',
          image: json['image'] != null ? json['image'] as String : '',
          description:
              json['description'] != null ? json['description'] as String : '',
          createdAt: DateTime.parse(json['created_at']),
          updatedAt: DateTime.parse(json['updated_at']),
        );

  Map<String, dynamic> toJson() {
    return {
      'idx': idx,
      'title': title,
      'image': image,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
