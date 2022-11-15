// edit symptoms item model
class EditMySymptomsItemModel {
  EditMySymptomsItemModel(
      {required this.title,
      required this.dateWritten,
      required this.mySymptoms,
      this.imagePath});
  String title;
  String dateWritten;
  String mySymptoms;
  String? imagePath;
}
