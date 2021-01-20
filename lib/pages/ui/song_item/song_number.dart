import 'package:flutter/material.dart';

import '../../../models/song_model.dart';

class SongNumber extends StatelessWidget {
  final Song item;
  final bool isFavoriteList;

  const SongNumber({this.item, this.isFavoriteList});

  @override
  Widget build(BuildContext context) {
    var textTheme2 = Theme.of(context).textTheme;
    return SizedBox(
      width: 80,
      child: Row(
        children: <Widget>[
          isFavoriteList
              ? Container()
              : (item.favorite
                  ? Icon(
                      Icons.star,
                      size: 16,
                      color: Theme.of(context).accentColor,
                    )
                  : Container()),
          Expanded(
            child: Text(
              item.number.padLeft(5, '0'),
              style: item.favorite
                  ? textTheme2.bodyText1.copyWith(fontSize: 22)
                  : textTheme2.bodyText1,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
