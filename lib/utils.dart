import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:startup_names/save_suggestion_model.dart';

final TextStyle biggerFont = const TextStyle(fontSize: 18.0);

Widget buildRow(WordPair pair, BuildContext context) {
  final _wordModel = Provider.of<WordModel>(context, listen: true);
  final alreadySaved = _wordModel.savedSuggestions.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: biggerFont,
    ),
    trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    ),
    onTap: () {
      Provider.of<WordModel>(context, listen: false).toggle(pair);
    },
  );
}
