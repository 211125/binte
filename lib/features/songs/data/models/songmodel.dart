import 'package:binte/features/songs/domain/entities/song.dart';

class SongModel extends Song {
  SongModel(
      {required int id,
      required String name,
      required String author,
      required String musicNote,
      required String pathSong,
      required String pathVideo,
      required String pathPdf,
      String? createdAt})
      : super(
          id: id,
          name: name,
          author: author,
          musicNote: musicNote,
          pathSong: pathSong,
          pathVideo: pathVideo,
          pathPdf: pathPdf,
          createdAt:createdAt
        );

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      musicNote: json['music_note'],
      pathSong: json['path_song'],
      pathVideo: json['path_video'],
      pathPdf: json['path_pdf'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'music_note': musicNote,
      'path_song': pathSong,
      'path_video': pathVideo,
      'path_pdf': pathPdf,
      'createdAt': createdAt
    };
  }
}
