// AI DOCUMENTATION
// - I use doccument hint from lab8 
// - I use flutter-networking-json slide for models example code
// @author Sawit Janpan
// @version 1.0.0
// @date 2026-02-17

class Album {
  final int userId;
  final int id;
  final String title;

  /// Constructor
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

}
