// To parse this JSON data, do
//
//     final detialApiModel = detialApiModelFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

DetialApiModel detialApiModelFromJson(String str) =>
    DetialApiModel.fromJson(json.decode(str));

String detialApiModelToJson(DetialApiModel data) =>
    json.encode(data.toJson());

class DetialApiModel {
  DetialApiModel({
    this.message,
  });

  Message? message;

  factory DetialApiModel.fromJson(Map<String, dynamic> json) =>
      DetialApiModel(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
      };
}

class Message {
  Message({
    required this.header,
    required this.body,
  });

  Header header;
  Body body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    required this.track,
  });

  Track track;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        track: Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track.toJson(),
      };
}

class Track {
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackNameTranslationList,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
  });

  int trackId;
  String trackName;
  List<dynamic> trackNameTranslationList;
  int trackRating;
  int commontrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichsync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  DateTime updatedTime;
  PrimaryGenres primaryGenres;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        trackId: json["track_id"],
        trackName: json["track_name"],
        trackNameTranslationList: List<dynamic>.from(
            json["track_name_translation_list"].map((x) => x)),
        trackRating: json["track_rating"],
        commontrackId: json["commontrack_id"],
        instrumental: json["instrumental"],
        explicit: json["explicit"],
        hasLyrics: json["has_lyrics"],
        hasSubtitles: json["has_subtitles"],
        hasRichsync: json["has_richsync"],
        numFavourite: json["num_favourite"],
        albumId: json["album_id"],
        albumName: json["album_name"],
        artistId: json["artist_id"],
        artistName: json["artist_name"],
        trackShareUrl: json["track_share_url"],
        trackEditUrl: json["track_edit_url"],
        restricted: json["restricted"],
        updatedTime: DateTime.parse(json["updated_time"]),
        primaryGenres: PrimaryGenres.fromJson(json["primary_genres"]),
      );

  Map<String, dynamic> toJson() => {
        "track_id": trackId,
        "track_name": trackName,
        "track_name_translation_list": List<dynamic>.from(
            trackNameTranslationList.map((x) => x)),
        "track_rating": trackRating,
        "commontrack_id": commontrackId,
        "instrumental": instrumental,
        "explicit": explicit,
        "has_lyrics": hasLyrics,
        "has_subtitles": hasSubtitles,
        "has_richsync": hasRichsync,
        "num_favourite": numFavourite,
        "album_id": albumId,
        "album_name": albumName,
        "artist_id": artistId,
        "artist_name": artistName,
        "track_share_url": trackShareUrl,
        "track_edit_url": trackEditUrl,
        "restricted": restricted,
        "updated_time": updatedTime.toIso8601String(),
        "primary_genres": primaryGenres.toJson(),
      };
}

class PrimaryGenres {
  PrimaryGenres({
    required this.musicGenreList,
  });

  List<dynamic> musicGenreList;

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) =>
      PrimaryGenres(
        musicGenreList: List<dynamic>.from(
            json["music_genre_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "music_genre_list":
            List<dynamic>.from(musicGenreList.map((x) => x)),
      };
}

class Header {
  Header({
    required this.statusCode,
    required this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}

class DetailApiAService {
  static var cleient = http.Client();
  Future<DetialApiModel> getApi(var trackId) async {
    var url = Uri.parse(
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=242634255&apikey=0ff5ec0ac765a5e82c4967f2323553c2");

    final response = await cleient.get(url);

    return detialApiModelFromJson(response.body);
    // print(activity.message);
    //return activity;
  }
}
