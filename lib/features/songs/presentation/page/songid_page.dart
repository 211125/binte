import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecase/getId_song_usecase.dart';
import '../getx/songid/Songid_Getx.dart';
import 'song_page.dart';

class SongIdPage extends StatelessWidget {
  final String songId;
  final SongidGetx songidController = Get.find<SongidGetx>();

  SongIdPage({required this.songId});

  @override
  Widget build(BuildContext context) {
    songidController.fetchCoDetails(FetchSongidDetailsEvent(id: songId));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.off(() => SongPage());
            },
          ),
          centerTitle: true,
          title: Text(
            'Music Flutter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/musica3.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Expanded(
            child: Obx(() {
              final state = songidController.state.value;

              if (state is SongidLoading) {
                return Center(
                    child: CircularProgressIndicator(color: Colors.blueAccent));
              } else if (state is SongidLoaded) {
                final song = state.posts.first;
                return Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        song.name,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Autor: ${song.author}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Nota musical: ${song.musicNote}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Ruta de la canción: ${song.pathSong}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Fecha de creación: ${song.createdAt}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is SongidFetchingFailure) {
                return Center(
                  child: Text('Error: ${state.error}',
                      style: TextStyle(color: Colors.red)),
                );
              } else {
                return Center(
                  child: Text('Estado desconocido.',
                      style: TextStyle(color: Colors.black)),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
