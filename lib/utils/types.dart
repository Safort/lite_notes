import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

part 'types.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime datetime;

  Note(this.title, this.description) {
    this.datetime = DateTime.now();
  }

  String getDate() {
    initializeDateFormatting();
    return DateFormat('dd.MM.yyyy').format(datetime);
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'datetime': getDate(),
  };
}
