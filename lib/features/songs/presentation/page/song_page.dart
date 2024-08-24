import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/songs/Songs_Getx.dart';
import 'songid_page.dart';

class SongPage extends StatelessWidget {
  final SongsGetx songsController = Get.find<SongsGetx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'My Playlist',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Obx(() {
              final state = songsController.state.value;

              if (state is SongsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SongsLoaded) {
                if (state.posts.isEmpty) {
                  return Center(child: Text('No hay canciones disponibles.'));
                }
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final song = state.posts[index];
                    final isSelected = songsController.selectedSongId.value ==
                        song.id.toString();

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green
                            : Color.fromARGB(255, 160, 72, 163),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/musica.jpg',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          song.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          song.author,
                          style: TextStyle(color: Colors.white70),
                        ),
                        trailing: Text(
                          "0:00",
                          style: TextStyle(color: Colors.white70),
                        ),
                        onTap: () {
                          songsController.selectSong(song.id.toString());
                          Get.to(() => SongIdPage(songId: song.id.toString()));
                        },
                      ),
                    );
                  },
                );
              } else if (state is SongsFetchingFailure) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return Center(child: Text('Estado desconocido.'));
              }
            }),
          ),
        ],
      ),
    );
  }
}
