import 'package:binte/features/songs/domain/entities/song.dart';
import 'package:binte/features/songs/domain/usecase/get_songs_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'songs_event.dart';
part 'songs_state.dart';

class SongsGetx extends GetxController {
  final GetSongsUsecase getSongsUsecase;
  var state = Rx<SongsState>(SongsInitial());
  var selectedSongId = ''.obs;

  void selectSong(String id) {
    selectedSongId.value = id;
  }
  SongsGetx({required this.getSongsUsecase});
 @override
  void onInit() {
    super.onInit();
    fetchCoDetails(FetchSongDetailsEvent());
  }
  fetchCoDetails(FetchSongDetailsEvent fetchSongDetailsEvent) async {
    state.value = SongsLoading();
    try {
      var addressDetails = await getSongsUsecase.execute();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (addressDetails.isEmpty) {
          state.value =
              SongsFetchingFailure("No hay ninguna musica registrada.");
        } else {
          state.value = SongsLoaded(addressDetails);
        }
      });
      print("Detalles de la musica obtenidos");
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        state.value = SongsFetchingFailure(e.toString());
      });
    }
  }
}
