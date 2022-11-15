class DrugmisuseModel {
  String title;
  String company;
  List<DrugmisuseTagModel>? tag;
  String? createdAt;

  DrugmisuseModel({
    required this.title,
    required this.company,
    this.tag,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'company': company,
        'tag': tag,
        'created_at': createdAt,
      };
}

class DrugmisuseTagModel {
  String? tagName;

  DrugmisuseTagModel({
    this.tagName,
  });

  Map<String, dynamic> toJson() => {
        'tag_name': tagName,
      };
}
