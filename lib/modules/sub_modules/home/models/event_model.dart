class EventModel {
  String date, category, name;
  EventModel({required this.date, required this.category, required this.name});

  static List<EventModel> events = [
    EventModel(
      name: 'This is a Birthday Party',
      category: 'birthday',
      date: '21\nNov',
    ),
    EventModel(
      name: 'Meeting for Updating The Development Method ',
      category: 'meeting',
      date: '22\nNov',
    ),
    EventModel(
      name: 'Watch R6s Tournament at Twitch',
      category: 'gaming',
      date: '23\nNov',
    ),
    EventModel(
      name: 'Meeting for a New Flutter Project',
      category: 'meeting',
      date: '23\nNov',
    ),
    EventModel(
      name: 'Visit the Grand Egyptian Museum with Friends',
      category: 'exhibition',
      date: '24\nNov',
    ),
    EventModel(
      name: 'Watch Rocket League Tournament at Twitch',
      category: 'gaming',
      date: '24\nNov',
    ),
  ];
}
