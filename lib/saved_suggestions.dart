import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:startup_names/save_suggestion_model.dart';
import 'package:startup_names/utils.dart';

class SavedSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordModel = Provider.of<WordModel>(context, listen: true);

    final tiles = wordModel.savedSuggestions.map(
      (WordPair pair) {
        return buildRow(pair, context);
      },
    );

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(context: context, tiles: tiles).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body:
          divided.isNotEmpty ? _buildList(divided) : _buildEmptyView(),
    );
  }

  Widget _buildList(List<Widget> children) {
    return ListView(children: children);
  }

  Widget _buildEmptyView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("List empty", style: biggerFont),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Favorite a suggestion and they will show up here."),
            ),
          ],
        ),
      ),
    );
  }
}
