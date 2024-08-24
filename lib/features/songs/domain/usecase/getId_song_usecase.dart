import 'package:binte/features/songs/domain/entities/song.dart';
import 'package:binte/features/songs/domain/repository/song_repository.dart';

class GetidSongUsecase {
  final SongRepository songRepository;
  GetidSongUsecase(this.songRepository);
  Future<List<Song>> execute(String id) async {
    return await songRepository.getIdSong(id);
  }
}
