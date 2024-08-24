import 'package:binte/features/songs/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getSongs();
  Future<List<Song>> getIdSong(String id);
}
