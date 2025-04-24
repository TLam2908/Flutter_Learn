class Todo {
  final int? id;
  final String title;
  const Todo ({required this.title, this.id});

  factory Todo.fromJson(Map<String, dynamic>json) {
   return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
   );
  }

  Map<String, dynamic> toJson() {
    final data = {'title': title};
    if (id != null) {
      data['id'] = id.toString();
    }
    return data;
  }
}
