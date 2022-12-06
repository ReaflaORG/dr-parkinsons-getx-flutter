class ParkinsonPostModel {
  int parkinson_post_id;
  String title;
  String image;
  String description;
  String created_at;
  String updated_at;

  ParkinsonPostModel({
    required this.parkinson_post_id,
    required this.title,
    required this.image,
    required this.description,
    required this.created_at,
    required this.updated_at,
  });

  ParkinsonPostModel.fromJson(json)
      : this(
          parkinson_post_id: json['parkinson_post_id'] != null
              ? json['parkinson_post_id'] as int
              : 0,
          title: json['title'] != null ? json['title'] as String : '',
          image: json['image'] != null ? json['image'] as String : '',
          description:
              json['description'] != null ? json['description'] as String : '',
          created_at:
              json['created_at'] != null ? json['created_at'] as String : '',
          updated_at:
              json['updated_at'] != null ? json['updated_at'] as String : '',
        );

  Map<String, dynamic> toJson() {
    return {
      'parkinson_post_id': parkinson_post_id,
      'title': title,
      'image': image,
      'description': description,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
