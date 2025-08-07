import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_task_app/models/event_model.dart';

abstract class FirebaseFirestoreUtil {
  static CollectionReference<EventModel> _getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventModel.collection)
        .withConverter(
          fromFirestore: (snapshot, _) =>
              EventModel.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  static Future<bool> createEvent(EventModel event) async {
    try {
      var reference = _getCollectionReference().doc();
      event.id = reference.id;
      await reference.set(event);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Stream<List<EventModel>> getEventsStream() {
    var reference = _getCollectionReference();

    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }
}
