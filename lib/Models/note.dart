class Notess {
  String id;
  final String color_id;
  final String creation_date;
  final String note_content;
  final String note_title;

  Notess({
    this.id = '',
    required this.color_id,
    required this.creation_date,
    required this.note_content,
    required this.note_title,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'color_id': color_id,
        'creation_date': creation_date,
        'note_content': note_content,
        'note_title': note_title,
      };

  Notess fromJson(Map<String, dynamic> json) => Notess(
        id: json['id'],
        color_id: json['color_id'],
        creation_date: json['creation_date'],
        note_content: json['note_content'],
        note_title: json['note_title'],
      );
}
