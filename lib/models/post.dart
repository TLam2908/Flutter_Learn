class Post {
  final int? id;
  final String title;
  final String description;

  Post({
    this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic>json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String
    );
  }

  Map<String, dynamic> toJson() {
    final data = {'title': title, 'description': description};
    if (id != null) {
      data['id'] = id.toString();
    }
    return data;
  }
}