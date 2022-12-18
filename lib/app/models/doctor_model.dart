// * 의사 모델
class DoctorModel {
  DoctorModel({
    required this.doctorId,
    required this.hospitalName,
    required this.hospitalLocationAddress,
    required this.hospitalLocationLatitude,
    required this.hospitalLocationLongitude,
    required this.doctorName,
    required this.doctorPosition,
    required this.doctorContents,
    required this.users,
  });

  final int doctorId;
  final String hospitalName;
  final String hospitalLocationAddress;
  final double hospitalLocationLatitude;
  final double hospitalLocationLongitude;
  final String doctorName;
  final String doctorPosition;
  final List<DoctorContent> doctorContents;
  final List<int> users;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        doctorId: json['doctor_id'],
        hospitalName: json['hospital_name'],
        hospitalLocationAddress: json['hospital_location_address'],
        hospitalLocationLatitude: json['hospital_location_latitude'].toDouble(),
        hospitalLocationLongitude:
            json['hospital_location_longitude'].toDouble(),
        doctorName: json['doctor_name'],
        doctorPosition: json['doctor_position'],
        doctorContents: List<DoctorContent>.from(
            json['doctor_contents'].map((x) => DoctorContent.fromJson(x))),
        users: List<int>.from(json['users'].map((x) => x)),
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
        'users': List<dynamic>.from(users.map((x) => x)),
      };
}

// * 의사 컨텐츠
class DoctorContent {
  DoctorContent({
    required this.doctorContentId,
    required this.doctorId,
    required this.contentType,
    required this.title,
    required this.content,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  final int doctorContentId;
  final int doctorId;
  final String contentType;
  final String title;
  final String content;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DoctorContent.fromJson(Map<String, dynamic> json) => DoctorContent(
        doctorContentId: json['doctor_content_id'],
        doctorId: json['doctor_id'],
        contentType: json['content_type'],
        title: json['title'],
        content: json['content'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'doctor_content_id': doctorContentId,
        'doctor_id': doctorId,
        'content_type': contentType,
        'title': title,
        'content': content,
        'description': description,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}
