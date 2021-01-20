import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_field.dart';
import '../../models/karaoke_model.dart';
import '../../models/song_model.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sm = Provider.of<SongModel>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PopupMenuButton<KaraokeModel>(
          tooltip: 'Choose Karaoke Model',
          child: Text(
              modelInfo.firstWhere((mi) => mi.value == sm.currentModel).name),
          itemBuilder: (context) => modelInfo
              .map((mi) => PopupMenuItem<KaraokeModel>(
                  value: mi.value,
                  child: Text(
                    mi.description == null ? mi.name : mi.description,
                  )))
              .toList(),
          onSelected: (newModel) {
            sm.setCurrentModel(newModel);
            sm.saveSongModelPreference();
          },
        ),
        SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 50,
            child: SearchField(),
          ),
        ),
        SizedBox(width: 10),
        PopupMenuButton<String>(
          tooltip: 'Choose Volume',
          child: Text(
            sm.currentVolume,
            style: Theme.of(context).appBarTheme.textTheme.headline5,
          ),
          itemBuilder: (context) => sm.volumes
              .map((v) => PopupMenuItem<String>(value: v, child: Text(v)))
              .toList(),
          onSelected: (volume) {
            sm.changeVolume(volume);
          },
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: Colors.white30,
          ),
          onPressed: () => showAboutDialog(
            context: context,
            applicationName: 'Platinum Karaoke Digital Songbook',
            applicationVersion: 'Version: 2.0.0',
            applicationLegalese: 'jiMcaN\n09557262636\njimcan009@gmail.com',
            applicationIcon: Image.asset('assets/songbook.png', scale: 10),
          ),
        )
      ],
    );
  }
}
