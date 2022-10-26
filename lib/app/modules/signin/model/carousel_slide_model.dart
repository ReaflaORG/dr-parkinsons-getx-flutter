class CarouselSlideModel {
  String title;
  String description;
  String image;

  CarouselSlideModel({
    this.title = '',
    this.description = '',
    this.image = '',
  });

  CarouselSlideModel copyWith({
    String title = '',
    String description = '',
    String image = '',
  }) =>
      CarouselSlideModel(
        title: title,
        description: description,
        image: image,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
      };
}
