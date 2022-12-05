/** 유저 모델 */
class UserModel {
  UserModel({
    required this.uid,
    required this.deviceToken,
    required this.provider,
    required this.providerId,
    required this.userEmail,
    required this.userName,
    required this.userPhoneNumber,
    required this.guardianName,
    required this.guardianPhoneNumber,
    required this.userGender,
    required this.userBirthDay,
    required this.diagnosticStatus,
    required this.diagnosticDay,
    required this.role,
    required this.notification,
    required this.postNotification,
    required this.missionNotification,
    required this.guardianNotification,
    required this.createdAt,
    required this.updatedAt,
    required this.lastLoginAt,
    required this.doctorId,
  });

  final int uid;
  final String deviceToken;
  final String provider;
  final String providerId;
  final String userEmail;
  final String? userName;
  final String? userPhoneNumber;
  final String? guardianName;
  final String? guardianPhoneNumber;
  final String? userGender;
  final DateTime? userBirthDay;
  final String? diagnosticStatus;
  final DateTime? diagnosticDay;
  final String role;
  final bool notification;
  final bool postNotification;
  final bool missionNotification;
  final bool guardianNotification;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastLoginAt;
  final int? doctorId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        deviceToken: json['device_token'],
        provider: json['provider'],
        providerId: json['provider_id'],
        userEmail: json['user_email'],
        userName: json['user_name'],
        userPhoneNumber: json['user_phoneNumber'],
        guardianName: json['guardian_name'],
        guardianPhoneNumber: json['guardian_phoneNumber'],
        userGender: json['user_gender'],
        userBirthDay: json['user_birth_day'] != null
            ? DateTime.parse(json['user_birth_day'])
            : null,
        diagnosticStatus: json['diagnostic_status'],
        diagnosticDay: json['diagnostic_day'] != null
            ? DateTime.parse(json['diagnostic_day'])
            : null,
        role: json['role'],
        notification: json['notification'],
        postNotification: json['post_notification'],
        missionNotification: json['mission_notification'],
        guardianNotification: json['guardian_notification'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        lastLoginAt: DateTime.parse(json['last_login_at']),
        doctorId: json['doctor_id'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'device_token': deviceToken,
        'provider': provider,
        'provider_id': providerId,
        'user_email': userEmail,
        'user_name': userName,
        'user_phoneNumber': userPhoneNumber,
        'guardian_name': guardianName,
        'guardian_phoneNumber': guardianPhoneNumber,
        'user_gender': userGender,
        'user_birth_day': userBirthDay?.toIso8601String(),
        'diagnostic_status': diagnosticStatus,
        'diagnostic_day': diagnosticDay?.toIso8601String(),
        'role': role,
        'notification': notification,
        'post_notification': postNotification,
        'mission_notification': missionNotification,
        'guardian_notification': guardianNotification,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'last_login_at': lastLoginAt.toIso8601String(),
        'doctor_id': doctorId,
      };
}
