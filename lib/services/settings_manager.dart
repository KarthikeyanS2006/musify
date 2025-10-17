

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musify/screens/playlist_page.dart';
import 'package:musify/screens/user_songs_page.dart';
import 'package:musify/utilities/utils.dart';

// Preferences

final shouldWeCheckUpdates = ValueNotifier<bool?>(
  Hive.box('settings').get('shouldWeCheckUpdates', defaultValue: null),
);

final playNextSongAutomatically = ValueNotifier<bool>(
  Hive.box('settings').get('playNextSongAutomatically', defaultValue: false),
);

final useSystemColor = ValueNotifier<bool>(
  Hive.box('settings').get('useSystemColor', defaultValue: true),
);

final usePureBlackColor = ValueNotifier<bool>(
  Hive.box('settings').get('usePureBlackColor', defaultValue: false),
);

final offlineMode = ValueNotifier<bool>(
  Hive.box('settings').get('offlineMode', defaultValue: false),
);

final ValueNotifier<bool> offlineModeChangeNotifier = ValueNotifier<bool>(
  false,
);

final predictiveBack = ValueNotifier<bool>(
  Hive.box('settings').get('predictiveBack', defaultValue: false),
);

final sponsorBlockSupport = ValueNotifier<bool>(
  Hive.box('settings').get('sponsorBlockSupport', defaultValue: false),
);

final defaultRecommendations = ValueNotifier<bool>(
  Hive.box('settings').get('defaultRecommendations', defaultValue: false),
);

final useProxy = ValueNotifier<bool>(
  Hive.box('settings').get('useProxy', defaultValue: false),
);

final audioQualitySetting = ValueNotifier<String>(
  Hive.box('settings').get('audioQuality', defaultValue: 'high'),
);

Locale languageSetting = getLocaleFromLanguageCode(
  Hive.box('settings').get('language', defaultValue: 'English') as String,
);

final themeModeSetting =
    Hive.box('settings').get('themeMode', defaultValue: 'dark') as String;

String playlistSortSetting = Hive.box(
  'settings',
).get('playlistSortType', defaultValue: PlaylistSortType.title.name);

String offlineSortSetting = Hive.box(
  'settings',
).get('offlineSortType', defaultValue: OfflineSortType.title.name);

Color primaryColorSetting = Color(
  Hive.box('settings').get('accentColor', defaultValue: 0xff91cef4),
);

// Non-Storage Notifiers

final shuffleNotifier = ValueNotifier<bool>(false);
final repeatNotifier = ValueNotifier<AudioServiceRepeatMode>(
  AudioServiceRepeatMode.none,
);

var sleepTimerNotifier = ValueNotifier<Duration?>(null);

// Server-Notifiers

final announcementURL = ValueNotifier<String?>(null);
