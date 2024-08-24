part of 'Songid_Getx.dart';

@immutable
abstract class SongidEvent {}

class FetchSongidDetailsEvent {
   final String id;
  FetchSongidDetailsEvent({required this.id});
}