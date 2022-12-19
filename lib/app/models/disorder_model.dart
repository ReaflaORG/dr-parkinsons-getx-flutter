import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DisorderModel {
  String? title;
  String? thumbnail;
  YoutubePlayerController youtubePlayer;
  String? createdAt;

  DisorderModel({
    this.title,
    this.thumbnail,
    required this.youtubePlayer,
    this.createdAt,
  });

  DisorderModel copyWith({
    String title = '',
    String thumbnail = '',
    required String url,
    String createdAt = '',
  }) =>
      DisorderModel(
        title: title,
        thumbnail: thumbnail,
        youtubePlayer: youtubePlayer,
        createdAt: createdAt,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'thumbnail': thumbnail,
        'youtube_player': youtubePlayer,
        'created_at': createdAt,
      };
}
