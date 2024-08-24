import 'package:binte/features/songs/data/datasource/song_data_source.dart';
import 'package:binte/features/songs/data/repositories/song_repository_Impl.dart';
import 'package:binte/features/songs/domain/usecase/getId_song_usecase.dart';
import 'package:binte/features/songs/domain/usecase/get_songs_usecase.dart';

class SongConfig {
  SongDataSourceImp? songDataSourceImp;
  SongRepositoryImpl? songRepositoryImpl;
  GetSongsUsecase? getSongsUsecase;
  GetidSongUsecase? getidSongUsecase;
  SongConfig() {
    songDataSourceImp = SongDataSourceImp();
    songRepositoryImpl = SongRepositoryImpl(songDataSource: songDataSourceImp!);
    getSongsUsecase = GetSongsUsecase(songRepositoryImpl!);
    getidSongUsecase = GetidSongUsecase(songRepositoryImpl!);
  }
}
