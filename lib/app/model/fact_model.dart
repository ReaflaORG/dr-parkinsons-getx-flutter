class FactModel {
  String? title;
  String? thumbnail;
  String? createdAt;

  FactModel({
    this.title,
    this.thumbnail,
    this.createdAt,
  });

  FactModel copyWith({
    String title = '',
    String thumbnail = '',
    required String url,
    String createdAt = '',
  }) =>
      FactModel(
        title: title,
        thumbnail: thumbnail,
        createdAt: createdAt,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'thumbnail': thumbnail,
        'created_at': createdAt,
      };
}
