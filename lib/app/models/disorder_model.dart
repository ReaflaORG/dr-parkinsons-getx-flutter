import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// 유튜브 비디오 모델
///
/// [title] String :비디오 제목
///
/// [thumbnail] String : 비디오 썸네일
///
/// [youtubePlayer] YoutubePlayerController : 비디오 플레이어
///
/// [createdAt] String : 비디오 업로드 날짜
class YoutubeVideoModel {
  String title;
  String thumbnail;
  YoutubePlayerController youtubePlayer;
  DateTime createdAt;

  YoutubeVideoModel({
    required this.title,
    required this.thumbnail,
    required this.youtubePlayer,
    required this.createdAt,
  });

  YoutubeVideoModel copyWith({
    String title = '',
    String thumbnail = '',
    required String url,
    required DateTime createdAt,
  }) {
    return YoutubeVideoModel(
      title: title,
      thumbnail: thumbnail,
      youtubePlayer: youtubePlayer,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'thumbnail': thumbnail,
      'youtube_player': youtubePlayer,
      'created_at': createdAt,
    };
  }
}
