import 'package:binte/features/songs/data/datasource/song_data_source.dart';
import 'package:binte/features/songs/data/models/songmodel.dart';
import 'package:binte/features/songs/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongDataSource songDataSource;
  SongRepositoryImpl({required this.songDataSource});
  @override
  Future<List<SongModel>> getIdSong(String id) async {
    return await songDataSource.getIdSong(id);
  }

  @override
  Future<List<SongModel>> getSongs() async {
    return await songDataSource.getSongs();
  }
}
