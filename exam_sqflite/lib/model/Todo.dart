class Todo {
  final int id;
  final String title;
  final String? content;
  final bool isDone;
  final DateTime? executedTime;

  Todo(
      {required this.id,
      required this.title,
      this.content = '',
      this.isDone = false,
      this.executedTime = null});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      // SQLite는 boolean type을 별도로 제공하지 않음.  // 0: false, 1: true
      'isDone': isDone ? 1 : 0,
      'executedTime':
          executedTime == null ? '' : executedTime?.toIso8601String()
    };
  }

  factory Todo.fromMap(Map<String, dynamic> data) {
    return Todo(
        id: data['id'] as int,
        title: data['title'] as String,
        content: data['content'] as String,
        isDone: data['isDone'] == 0 ? false : true,
        executedTime: data['executedTime'] != ''
            ? DateTime.parse(data['executedTime'])
            : data['executedTime']);
  }

  @override
  String toString() {
    return 'Todo [id: $id, title: $title, content: $content, isDone: $isDone, excutedTime: $executedTime]';
  }
}
