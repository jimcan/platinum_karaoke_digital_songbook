import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'karaoke_model.dart';

class Song {
  final int id;
  final String artist;
  final String title;
  final String type;
  final String number;
  final String volume;
  final String status;
  final bool favorite;
  final String month;
  final String icon;

  Song({
    this.id,
    this.artist,
    this.title,
    this.type,
    this.number,
    this.volume,
    this.status,
    this.favorite,
    this.month,
    this.icon,
  });

  Song.fromJsonMap(Map<String, dynamic> map)
      : id = map['_id'],
        artist = map['Artist'],
        title = map['Title'],
        type = map['Type'],
        number = map['Number'],
        volume = map['Volume'],
        status = map['Status'],
        favorite = map['Favorite'] == 1,
        month = map['Month'],
        icon = map['Icon'];
}

class SongModel with ChangeNotifier {
  static const kDbFileName = 'platinumSongs.db';
  final String songModelKey = 'songModel';
  bool _isLoading = true;
  TextEditingController searchController;
  KaraokeModel _currentModel = KaraokeModel.ks;
  Database _db;
  List<Song> _songs = [];
  List<Song> _suggestions = [];
  List<Song> _byVolume = [];
  List<String> _volumes = ['All'];
  String _currentVolume = 'All';

  SongModel() {
    _initDb();
    _loadSongModelPreference();
    searchController = TextEditingController();
  }

  List<Song> get songs => _songs;
  bool get isLoading => _isLoading;
  List<String> get volumes => _volumes;
  String get currentVolume => _currentVolume;
  KaraokeModel get currentModel => _currentModel;
  List<Song> get suggestions => _suggestions;

  void onSearch(String query) {
    _suggestions = _byVolume.where((s) {
      if (s.title != null && s.artist != null) {
        return s.title.toLowerCase().contains(query.toLowerCase()) ||
            s.artist.toLowerCase().contains(query.toLowerCase());
      } else {
        return false;
      }
    }).toList();
    notifyListeners();
  }

  void clearSearchField() {
    onSearch('');
    searchController.clear();
    notifyListeners();
  }

  void changeVolume(volume) {
    _byVolume = volume == 'All'
        ? _byVolume = _songs
        : songs.where((s) => s.volume == volume).toList();
    _currentVolume = volume;
    onSearch(searchController.text);
  }

  Future<void> _initDb() async {
    _isLoading = true;
    Directory dir = Platform.isLinux
        ? Directory.current
        : await pp.getApplicationDocumentsDirectory();
    final dbPath = join('${dir.path}', kDbFileName);

    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load('assets/platinumSongs.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    _db = await openDatabase(dbPath);
    _loadSongs();
  }

  Future<void> _loadSongs() async {
    _isLoading = true;
    List<Map> jsons = await _db.rawQuery(
      'SELECT * FROM ${modelInfo.firstWhere((cm) => cm.value == _currentModel).path}',
    );
    _songs = jsons.map((j) => Song.fromJsonMap(j)).toList();
    _songs.forEach((s) => {
          if (!_volumes.contains(s.volume)) _volumes.add(s.volume),
        });
    _byVolume = _currentVolume == 'All'
        ? _byVolume = _songs
        : songs.where((s) => s.volume == _currentVolume).toList();
    onSearch(searchController.text);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _toggleFavorite(Song song) async {
    await _db.rawUpdate(
      '''
      UPDATE ${modelInfo.firstWhere((cm) => cm.value == _currentModel).path}
        SET Favorite = ?
        WHERE _id = ?
      ''',
      [song.favorite ? 0 : 1, song.id],
    );
    _loadSongs();
  }

  void _setCurrentModel(KaraokeModel model) {
    _currentModel = model;
    _volumes = ['All'];
    changeVolume('All');
    _loadSongs();
    notifyListeners();
  }

  Future<void> saveSongModelPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(songModelKey,
        modelInfo.firstWhere((mi) => mi.value == currentModel).id);
  }

  Future<void> _loadSongModelPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int songModel = prefs.getInt(songModelKey);

    if (songModel != null) {
      _currentModel = modelInfo.firstWhere((mi) => mi.id == songModel).value;
    } else {
      _currentModel = KaraokeModel.ks;
    }
  }

  Function get loadSongs => _loadSongs;
  Function(Song) get toggleFavorite => _toggleFavorite;
  Function(KaraokeModel model) get setCurrentModel => _setCurrentModel;
}
