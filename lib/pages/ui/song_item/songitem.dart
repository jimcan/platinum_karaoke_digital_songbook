import 'package:flutter/material.dart';

import 'add_to_favorites_dialog.dart';
import 'song_number.dart';
import '../../../models/song_model.dart';
import '../../../pages/ui/song_item/song_title.dart';

class SongItem extends StatelessWidget {
  const SongItem({this.item, this.isFavoriteList});

  final Song item;
  final bool isFavoriteList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => showDialog(
          context: context,
          builder: (_) => AddToFavDialog(item: item, ctx: context)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          height: 55,
          child: Row(
            children: <Widget>[
              SongNumber(item: item, isFavoriteList: isFavoriteList),
              SizedBox(width: 15),
              SongTitle(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
