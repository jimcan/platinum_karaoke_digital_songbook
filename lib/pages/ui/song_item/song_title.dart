import 'package:flutter/material.dart';

import '../../../models/song_model.dart';

class SongTitle extends StatelessWidget {
  final Song item;

  const SongTitle({this.item});

  @override
  Widget build(BuildContext context) {
    var textTheme2 = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            item.title,
            style: textTheme2.bodyText2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item.artist,
                  style: textTheme2.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: Text(
                  item.volume,
                  textAlign: TextAlign.end,
                  style: textTheme2.subtitle2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
