import 'package:assignment/models/patientFiles.dart';

class Service {
  List<PatientFiles> getMostRecentFiles() {
    return [
      PatientFiles(fileName: 'Medical notes', dateAdded: 'Today'),
      PatientFiles(fileName: 'Lab tebs', dateAdded: 'Yesterday'),
      PatientFiles(fileName: 'App card', dateAdded: '2 days ago'),
      PatientFiles(fileName: 'Out of ideas', dateAdded: '4 days ago'),
      PatientFiles(fileName: 'Simple but', dateAdded: '5 days ago'),
      PatientFiles(fileName: 'New Drugs', dateAdded: '8 days ago'),
    ];
  }
}
