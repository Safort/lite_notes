
class Note {
  String title;
  String description;

  Note(this.title, this.description);

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
  };
}
