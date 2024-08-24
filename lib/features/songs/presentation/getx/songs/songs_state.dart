part of 'Songs_Getx.dart';

@immutable
abstract class SongsState {}

class SongsInitial extends SongsState {}

class SongsLoading extends SongsState {}

class SongsLoaded extends SongsState {
  final List<Song> posts;

  SongsLoaded(this.posts);
}

class SongsFetchingFailure extends SongsState {
  final String error;

  SongsFetchingFailure(this.error);
}