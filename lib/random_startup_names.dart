import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_names/saved_suggestions.dart';
import 'package:startup_names/utils.dart';

class RandomStartupNames extends StatefulWidget {
  @override
  _RandomStartupNamesState createState() => _RandomStartupNamesState();
}

class _RandomStartupNamesState extends State<RandomStartupNames> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(context),
    );
  }

  void _pushSaved() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SavedSuggestions()));
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(_suggestions[index], context);
        });
  }
}
