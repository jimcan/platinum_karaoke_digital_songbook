import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/song_model.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sm = Provider.of<SongModel>(context);

    return TextField(
      style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 20),
      controller: sm.searchController,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search Title or Singer',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        fillColor: Colors.white12,
        filled: true,
        suffixIcon: sm.searchController.text.isEmpty
            ? null
            : IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => sm.clearSearchField(),
              ),
      ),
      onChanged: (query) => sm.onSearch(query),
    );
  }
}
