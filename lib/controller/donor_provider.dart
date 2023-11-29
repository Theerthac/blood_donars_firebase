
import 'package:blood_donation/model/donors_model.dart';
import 'package:blood_donation/services/firebase/firebase_service.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {
  final FirebaseService firebaseService = FirebaseService();
  String? selectedgroups;

  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

  List<DonorsModel> donors = [];

  Future<void> fetchDonors() async {
    donors = await firebaseService.fetchDonors();
    notifyListeners();
  }

  Future<void> deleteDonor(String docId) async {
    firebaseService.deleteDonor(docId);
    await fetchDonors();
    notifyListeners();
  }

  void setSelectedGroup(String value) {
    selectedgroups = value;
    notifyListeners();
  }

  void addDonor() async {
    final donor = DonorsModel(
      id: "",
      name: donorName.text,
      phone: donorPhone.text,
      group: selectedgroups,
    );
    firebaseService.addDonor(donor);
    await fetchDonors();
    notifyListeners();
  }

 void updateDonor(String docId) async { 
  final donor=DonorsModel(
    id: docId,
     name:donorName.text,
      phone: donorPhone.text,
       group:selectedgroups
       );
       firebaseService.updateDonor(donor);
    await fetchDonors();
    notifyListeners();
  }
}
