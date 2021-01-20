import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/song_model.dart';
import 'ui/appbar_title.dart';
import 'ui/listview_builder.dart';

class HomePage extends StatelessWidget {
  final TextEditingController textEditingController;

  HomePage() : textEditingController = TextEditingController();

  final List<Tab> _tabs = [
    Tab(text: 'ALL'),
    Tab(text: 'REGIONAL'),
    Tab(text: 'NEW'),
    Tab(text: 'FAVORITES'),
  ];

  List<Song> _sorted(List<Song> songList) {
    songList
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    return songList;
  }

  List<Widget> _pages(SongModel sm) {
    return [
      ListViewBuilder(songList: _sorted(sm.suggestions)),
      ListViewBuilder(
        songList: _sorted(
          sm.suggestions.where((s) => s.type == 'Regional').toList(),
        ),
      ),
      ListViewBuilder(
        songList: _sorted(
          sm.suggestions.where((s) => s.status == 'New').toList(),
        ),
      ),
      ListViewBuilder(
        songList: _sorted(
          sm.suggestions.where((s) => s.favorite).toList(),
        ),
        isFavoriteList: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sm = Provider.of<SongModel>(context);

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppBarTitle(),
          bottom: TabBar(tabs: _tabs, isScrollable: true),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(230, 10, 10, 60), Color(0xee443355)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBarView(children: _pages(sm)),
        ),
      ),
    );
  }
}
