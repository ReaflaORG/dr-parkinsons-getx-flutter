class SearchDoctorsModel {
  int doctorId;
  String hospitalName;
  String hospitalLocationAddress;
  double hospitalLocationLatitude;
  double hospitalLocationLongitude;
  String doctorName;
  String doctorPosition;
  List<SearchContentModel> doctorContents;

  SearchDoctorsModel({
    required this.doctorId,
    required this.hospitalName,
    required this.hospitalLocationAddress,
    required this.hospitalLocationLatitude,
    required this.hospitalLocationLongitude,
    required this.doctorName,
    required this.doctorPosition,
    required this.doctorContents,
  });

  factory SearchDoctorsModel.fromJson(Map<String, dynamic> json) =>
      SearchDoctorsModel(
        doctorId: json['doctor_id'],
        hospitalName: json['hospital_name'],
        hospitalLocationAddress: json['hospital_location_address'],
        hospitalLocationLatitude: json['hospital_location_latitude'],
        hospitalLocationLongitude: json['hospital_location_longitude'],
        doctorName: json['doctor_name'],
        doctorPosition: json['doctor_position'],
        doctorContents: List<SearchContentModel>.from(
            json['doctor_contents'].map((x) => SearchContentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'doctor_id': doctorId,
        'hospital_name': hospitalName,
        'hospital_location_address': hospitalLocationAddress,
        'hospital_location_latitude': hospitalLocationLatitude,
        'hospital_location_longitude': hospitalLocationLongitude,
        'doctor_name': doctorName,
        'doctor_position': doctorPosition,
        'doctor_contents':
            List<dynamic>.from(doctorContents.map((x) => x.toJson())),
      };
}

class SearchContentModel {
  int doctorContentId;
  int doctorId;
  String title;
  String content;
  String contentType;
  String contentProvider;
  String? contentThumbnail;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  SearchContentModel({
    required this.doctorContentId,
    required this.doctorId,
    required this.title,
    required this.content,
    required this.contentType,
    required this.contentProvider,
    required this.contentThumbnail,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchContentModel.fromJson(Map<String, dynamic> json) =>
      SearchContentModel(
        doctorContentId: json['doctor_content_id'],
        doctorId: json['doctor_id'],
        title: json['title'],
        content: json['content'],
        contentType: json['content_type'],
        contentProvider: json['content_provider'],
        contentThumbnail: json['content_thumbnail'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() {
    return {
      'doctor_content_id': doctorContentId,
      'doctor_id': doctorId,
      'title': title,
      'content': content,
      'content_type': contentType,
      'content_provider': contentProvider,
      'content_thumbnail': contentThumbnail,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
