class EventModel {
  static const String collection = 'events';
  final String id;
  final String name;
  final String description;
  final String category;
  final bool isFavourite;
  EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.isFavourite,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'isFavourite': isFavourite,
    };
  }

  factory EventModel.fromFirestore(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      isFavourite: map['isFavourite'] as bool,
    );
  }
}
