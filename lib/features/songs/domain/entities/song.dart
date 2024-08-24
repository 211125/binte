class Song {
  int id;
  String name;
  String author;
  String musicNote;
  String pathSong;
  String pathVideo;
  String pathPdf;
  int? idStatus;
  int? idOrganization;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? letter;

  Song({
    required this.id,
    required this.name,
    required this.author,
    required this.musicNote,
    required this.pathSong,
    required this.pathVideo,
    required this.pathPdf,
    this.idStatus,
    this.idOrganization,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.letter,
  });
}
