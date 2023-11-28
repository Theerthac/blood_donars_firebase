import 'package:blood_donation/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference firebasedonor =
      FirebaseFirestore.instance.collection('donors');

  Future<List<DonorsModel>> fetchDonors() async {
    final snapshot = await firebasedonor.orderBy('name').get();
    return snapshot.docs.map((doc) {
      return DonorsModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  void deleteDonor(String docId) {
    firebasedonor.doc(docId).delete();
  }

  void addDonor(DonorsModel donor) {
    final data = donor.toMap();
    firebasedonor.add(data);
  }

  void updateDonor(DonorsModel donor) {
    final data = donor.toMap();
    firebasedonor.doc(donor.id).update(data);
  }
}
