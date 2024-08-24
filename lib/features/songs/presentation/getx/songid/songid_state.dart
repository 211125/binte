part of 'Songid_Getx.dart';

@immutable
abstract class SongidState {}

class SongidInitial extends SongidState {}

class SongidLoading extends SongidState {}

class SongidLoaded extends SongidState {
  final List<Song> posts;

  SongidLoaded(this.posts);
}

class SongidFetchingFailure extends SongidState {
  final String error;

  SongidFetchingFailure(this.error);
}