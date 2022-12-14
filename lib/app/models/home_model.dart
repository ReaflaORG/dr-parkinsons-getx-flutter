import 'package:dr_parkinsons/app/models/mission_model.dart';
import 'package:dr_parkinsons/app/models/welfare_model.dart';

class HomeModel {
  List<WelfareModel> welfare;
  List<MissionModel> mission;

  HomeModel({
    required this.welfare,
    required this.mission,
  });

  HomeModel.fromJson(json)
      : this(
          welfare: List.generate(
            json['welfares'].length,
            (index) => WelfareModel.fromJson(
              json['welfares'][index],
            ),
          ),
          mission: List.generate(
            json['missions'].length,
            (index) => MissionModel.fromJson(
              json['missions'][index],
            ),
          ),
        );

  Map<String, dynamic> toJson() {
    return {
      'welfare': welfare,
      'mission': mission,
    };
  }
}
