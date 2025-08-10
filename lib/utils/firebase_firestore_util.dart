import 'dart:developer';

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

  static Stream<List<EventModel>> getEventsStream({required int catId}) {
    var reference = _getCollectionReference().where(
      "categoryId",
      isEqualTo: catId,
    );

    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  static Future<void> setFavEvent({required EventModel event}) {
    var collectionRef = _getCollectionReference().doc(event.id);
    return collectionRef.update({"isFavourite": !event.isFavourite!});
  }

  static Future<bool> editEvent({required EventModel event}) async {
    var collectionRef = _getCollectionReference().doc(event.id);
    try {
      await collectionRef.update(event.toFirestore());
      return true;
    } catch (e) {
      log(e.toString());
      log(event.id.toString());
      return false;
    }
  }

  static Future<void> deleteEvent({required EventModel event}) {
    var collectionRef = _getCollectionReference().doc(event.id);
    return collectionRef.delete();
  }

  static Stream<List<EventModel>> getFavEventsStream() {
    var reference = _getCollectionReference().where(
      "isFavourite",
      isEqualTo: true,
    );

    return reference.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }
}
