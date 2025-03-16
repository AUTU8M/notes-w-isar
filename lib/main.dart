import 'package:flutter/material.dart';
import 'package:notesapp_isar/models/note_database.dart';
import 'package:notesapp_isar/pages/notes_page.dart';
import 'package:notesapp_isar/theme/themedata_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
        //theme provider
        ChangeNotifierProvider(create: (context) => ThemedataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
      theme: Provider.of<ThemedataProvider>(context).themeData,
    );
  }
}
