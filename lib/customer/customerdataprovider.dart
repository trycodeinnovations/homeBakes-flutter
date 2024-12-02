import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/customers/customerscakegetfun.dart';
import 'package:homebakes/provider/customercakedatamodel.dart';  // Make sure this import is correct for your data model

class CustomerProvider with ChangeNotifier {
  // The full list of customer cake data
  List<CustomerCakeData> _allData = [];
  
  // The filtered list that will be shown in the UI
  List<CustomerCakeData> _filteredData = [];

  // A controller for the search bar
  TextEditingController searchController = TextEditingController();

  // Getter to access filtered data
  List<CustomerCakeData> get filteredData => _filteredData;

  // Function to fetch data from Firebase (replace with your actual logic)
  Future<void> fetchCustomerData() async {
    // Replace with your actual logic to fetch customer data from Firebase
    _allData = await Customerget(); // Assuming Customerget() is your data fetching function.
    _filteredData = _allData; // Initially, show all data
    notifyListeners();
  }

  // Function to filter products based on the search query
  void filterProducts(String query) {
    // Filtering the data based on the query
    final filtered = _allData.where((item) {
      return item.cakename.toLowerCase().contains(query.toLowerCase());
    }).toList();

    _filteredData = filtered;
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
