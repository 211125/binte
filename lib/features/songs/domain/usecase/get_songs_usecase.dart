import 'package:binte/features/songs/domain/entities/song.dart';
import 'package:binte/features/songs/domain/repository/song_repository.dart';

class GetSongsUsecase {
  final SongRepository songRepository;
  GetSongsUsecase(this.songRepository);
  Future<List<Song>> execute() async{
    return await songRepository.getSongs();
  }
}