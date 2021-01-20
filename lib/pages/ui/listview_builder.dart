import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'song_item/songitem.dart';
import '../../models/song_model.dart';

class ListViewBuilder extends StatelessWidget {
  final List<Song> songList;
  final bool isFavoriteList;

  ListViewBuilder({this.songList, this.isFavoriteList = false})
      : scrollController = ScrollController();

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final songModel = Provider.of<SongModel>(context);

    return songModel.isLoading
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white12,
            ),
          )
        : DraggableScrollbar.rrect(
            padding: EdgeInsets.only(right: 10),
            backgroundColor: Colors.lightGreenAccent.withAlpha(200),
            controller: scrollController,
            child: ListView.builder(
              dragStartBehavior: DragStartBehavior.start,
              controller: scrollController,
              cacheExtent: 60,
              itemExtent: 60,
              itemCount: songList.length,
              itemBuilder: (context, index) {
                Song _item = songList[index];
                return SongItem(item: _item, isFavoriteList: isFavoriteList);
              },
            ),
          );
  }
}
