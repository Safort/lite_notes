import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lite_notes/utils/types.dart';

Future<int> initDB() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  return 0;
}
