// write my symptoms item model
class WriteMySymptomsItemModel {
  WriteMySymptomsItemModel(
      {required this.title,
      required this.dateWritten,
      required this.content,
      this.imagePath});

  String title;
  String dateWritten;
  String content;
  String? imagePath;
}
