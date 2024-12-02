import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/bakermodel.dart';

class Adminprovider extends ChangeNotifier {
  List<Baker> pendingwaitinglist = [];

  get bakerapprovedlist => null;  // Example list of pending bakers

  // Method to load pending bakers
  Future<void> getPendingBakers() async {
    // Load data from Firestore or API
    // After fetching, notify listeners
    notifyListeners();
  }
}