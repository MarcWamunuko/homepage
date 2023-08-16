import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:homepage/pages/current_page.dart';

import 'package:homepage/utilities/note_models/note_data.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialise hive
  await Hive.initFlutter();
  //open a hive box
  await Hive.openBox("note_database");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => const MaterialApp(
          debugShowCheckedModeBanner: false, home: CurrentPage()),
    );
  }
}
