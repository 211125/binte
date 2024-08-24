import 'package:binte/features/songs/presentation/getx/songid/Songid_Getx.dart';
import 'package:binte/features/songs/presentation/getx/songs/Songs_Getx.dart';
import 'package:binte/song_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/songs/presentation/page/song_page.dart';
SongConfig songConfig = SongConfig();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    
    Get.put(SongsGetx(getSongsUsecase: songConfig.getSongsUsecase!));
    Get.put(SongidGetx(getidSongUsecase: songConfig.getidSongUsecase!));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SongPage(),
      debugShowCheckedModeBanner: false,
    ); 
  }
}
