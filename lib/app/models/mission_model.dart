class MissionModel {
  int mission_id;
  int uid;
  String mission_type;
  int mission_time;
  String mission_time_string;
  bool mission_remove;
  String created_at;
  String remove_at;
  bool clear;
  String? status;
  MissionModel({
    required this.mission_id,
    required this.uid,
    required this.mission_type,
    required this.mission_time,
    required this.mission_time_string,
    required this.mission_remove,
    required this.created_at,
    required this.remove_at,
    required this.clear,
    this.status,
  });

  MissionModel.fromJson(json)
      : this(
          mission_id:
              json['mission_id'] != null ? json['mission_id'] as int : 0,
          uid: json['uid'] != null ? json['uid'] as int : 0,
          mission_type: json['mission_type'] != null
              ? json['mission_type'] as String
              : '',
          mission_time:
              json['mission_time'] != null ? json['mission_time'] as int : 0,
          mission_time_string: json['mission_time_string'] != null
              ? json['mission_time_string'] as String
              : '',
          mission_remove: json['mission_remove'] != null
              ? json['mission_remove'] as bool
              : false,
          created_at:
              json['created_at'] != null ? json['created_at'] as String : '',
          remove_at:
              json['remove_at'] != null ? json['remove_at'] as String : '',
          clear: json['clear'] != null ? json['clear'] as bool : false,
          status: '',
        );

  Map<String, Object> toJson() {
    return {
      'mission_id': mission_id,
      'uid': uid,
      'mission_type': mission_type,
      'mission_time': mission_time,
      'mission_time_string': mission_time_string,
      'mission_remove': mission_remove,
      'created_at': created_at,
      'remove_at': remove_at,
      'clear': clear,
      'status': status!,
    };
  }
}
