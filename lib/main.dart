import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_names/random_startup_names.dart';

import 'save_suggestion_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordModel(),
      child: MaterialApp(
        title: 'Startup Name Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: RandomStartupNames(),
      ),
    );
  }
}
