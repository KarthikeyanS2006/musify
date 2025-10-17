

import 'package:audio_service/audio_service.dart';

Map mediaItemToMap(MediaItem mediaItem) => {
  'id': mediaItem.id,
  'ytid': mediaItem.extras!['ytid'],
  'album': mediaItem.album.toString(),
  'artist': mediaItem.artist.toString(),
  'title': mediaItem.title,
  'highResImage': mediaItem.artUri.toString(),
  'lowResImage': mediaItem.extras!['lowResImage'],
  'isLive': mediaItem.extras!['isLive'],
};

MediaItem mapToMediaItem(Map song) => MediaItem(
  id: song['id'].toString(),
  album: '',
  artist: song['artist'].toString().trim(),
  title: song['title'].toString(),
  artUri:
      song['isOffline'] ?? false
          ? Uri.file(song['highResImage'].toString())
          : Uri.parse(song['highResImage'].toString()),
  duration:
      song['duration'] != null ? Duration(seconds: song['duration']) : null,
  extras: {
    'lowResImage': song['lowResImage'],
    'ytid': song['ytid'],
    'isLive': song['isLive'],
    'isOffline': song['isOffline'],
    'artWorkPath': song['highResImage'].toString(),
  },
);


bool durationEquals(Duration? prev, Duration? curr) {
  if (prev == curr) return true;
  if (prev == null || curr == null) return prev == curr;

  // Consider durations equal if they differ by less than 1 second
  return (prev - curr).abs() < const Duration(seconds: 1);
}
