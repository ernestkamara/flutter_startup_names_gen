import 'dart:collection';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordModel extends ChangeNotifier {
  final _saved = <WordPair>{};

  UnmodifiableListView<WordPair> get savedSuggestions =>
      UnmodifiableListView(_saved);

  void toggle(WordPair wordPair) {
    if (_saved.contains(wordPair)) {
      _saved.remove(wordPair);
    } else {
      _saved.add(wordPair);
    }
    notifyListeners();
  }
}
