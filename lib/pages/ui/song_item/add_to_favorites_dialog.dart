import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/song_model.dart';

class AddToFavDialog extends StatelessWidget {
  final Song item;
  final BuildContext ctx;

  const AddToFavDialog({this.item, this.ctx});

  @override
  Widget build(BuildContext context) {
    final sm = Provider.of<SongModel>(context);
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(item.title),
      content: Text(
        item.favorite
            ? 'Do you wan\'t to remove this item from favorites?'
            : 'Do you wan\'t to add this item to favorites?',
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'CANCEL',
            style: theme.textTheme.bodyText1.copyWith(
                color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(sm.toggleFavorite(item));
            Scaffold.of(ctx).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepPurple,
                content: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: item.title,
                    style: theme.textTheme.subtitle2
                        .copyWith(fontWeight: FontWeight.w700, color: Color(0xffeeccdd),),
                    children: [
                      TextSpan(
                        text: item.favorite
                            ? ' has been removed from favorites'
                            : ' has been added to favorites',
                        style: theme.textTheme.subtitle2
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text(
            item.favorite ? 'REMOVE' : 'ADD',
            style: theme.textTheme.bodyText1.copyWith(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
