import 'package:assignment/models/patientFiles.dart';
import 'package:assignment/services/api.dart';
import 'package:flutter/material.dart';

enum LoadingState { none, loading, error }

class PatientCardStore with ChangeNotifier {
  PatientCardStore() {
    getPatientsCards();
  }

  List<PatientFiles> patientCards = [];
  LoadingState _state = LoadingState.loading;
  

  Future<void> getPatientsCards() async{
    var api = Service();
    patientCards = api.getMostRecentFiles();
    _state = LoadingState.none;
    notifyListeners();
  }

}
