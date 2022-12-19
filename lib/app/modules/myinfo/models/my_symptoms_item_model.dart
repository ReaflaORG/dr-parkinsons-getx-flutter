class MySymptomsModel {
  int symptomHistoryId;
  int uid;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<SymptomHistoryFilesModel> symptomHistoryFiles;

  MySymptomsModel({
    required this.symptomHistoryId,
    required this.uid,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.symptomHistoryFiles,
  });

  factory MySymptomsModel.fromJson(Map<String, dynamic> json) =>
      MySymptomsModel(
        symptomHistoryId: json['symptom_history_id'],
        uid: json['uid'],
        title: json['title'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        symptomHistoryFiles: List<SymptomHistoryFilesModel>.from(
            json['symptom_history_files']
                .map((x) => SymptomHistoryFilesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    return {
      'symptom_history_id': symptomHistoryId,
      'uid': uid,
      'title': title,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'symptom_history_files':
          List<dynamic>.from(symptomHistoryFiles.map((x) => x.toJson())),
    };
  }
}

class SymptomHistoryFilesModel {
  int symptomHistoryId;
  int fileId;
  String type;
  String url;
  String? thumbnail;

  SymptomHistoryFilesModel({
    required this.symptomHistoryId,
    required this.fileId,
    required this.type,
    required this.url,
    required this.thumbnail,
  });

  factory SymptomHistoryFilesModel.fromJson(Map<String, dynamic> json) =>
      SymptomHistoryFilesModel(
        symptomHistoryId: json['symptom_history_id'],
        fileId: json['file_id'],
        type: json['type'],
        url: json['url'],
        thumbnail: json['thumbnail'],
      );

  Map<String, dynamic> toJson() {
    return {
      'symptom_history_id': symptomHistoryId,
      'file_id': fileId,
      'type': type,
      'url': url,
      'thumbnail': thumbnail,
    };
  }
}
