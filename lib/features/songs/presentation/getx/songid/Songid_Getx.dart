import 'package:binte/features/songs/domain/entities/song.dart';
import 'package:binte/features/songs/domain/usecase/getId_song_usecase.dart';
import 'package:binte/features/songs/domain/usecase/get_songs_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'songid_event.dart';
part 'songid_state.dart';

class SongidGetx extends GetxController {
  final GetidSongUsecase getidSongUsecase;
  var state = Rx<SongidState>(SongidInitial());

  SongidGetx({required this.getidSongUsecase});


  fetchCoDetails(FetchSongidDetailsEvent fetchSongDetailsEvent) async {
    state.value = SongidLoading();
    try {
      var addressDetails = await getidSongUsecase.execute(fetchSongDetailsEvent.id);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (addressDetails.isEmpty) {
          state.value =
              SongidFetchingFailure("No se encontro la musica");
        } else {
          state.value = SongidLoaded(addressDetails);
        }
      });
      print("Detalles de la musica obtenidos");
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        state.value = SongidFetchingFailure(e.toString());
      });
    }
  }
}
