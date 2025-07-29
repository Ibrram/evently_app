class EventModel {
  static const String collection = 'events';
  String? id;
  final String name;
  final String description;
  final String date;
  final String time;
  final int categoryId;
  final bool? isFavourite;

  EventModel({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.categoryId,
    this.isFavourite = false,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'categoryId': categoryId,
      'isFavourite': isFavourite,
    };
  }

  factory EventModel.fromFirestore(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      categoryId: map['categoryId'] as int,
      isFavourite: map['isFavourite'] != null
          ? map['isFavourite'] as bool
          : null,
    );
  }
}
