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

  static Future<List<EventModel>> getEvents() async {
    var reference = _getCollectionReference();
    var snapshot = await reference.get();

    return snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }
}
