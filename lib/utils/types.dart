import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class Note {
  String title;
  String description;
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
