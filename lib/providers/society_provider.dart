import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/society.dart';

class SocietyProvider with ChangeNotifier {
  List<Society> _societies = []; // List of societies
  StreamController<List<Society>> _societyController = StreamController<List<Society>>.broadcast();

  // Getter for accessing the list of societies
  List<Society> get societies => _societies;

  // Getter for accessing the stream of societies
  Stream<List<Society>> get societyStream => _societyController.stream;

  // Function to add a society to the list
  void addSociety(Society society) {
    _societies.add(society);
    notifyListeners();
    _updateStream();
  }

  // Function to update a society in the list
  void updateSociety(Society updatedSociety) {
    int index = _societies.indexWhere((society) => society.id == updatedSociety.id);
    if (index != -1) {
      _societies[index] = updatedSociety;
      notifyListeners();
      _updateStream();
    }
  }

  // Function to remove a society from the list
  void removeSociety(String societyId) {
    _societies.removeWhere((society) => society.id == societyId);
    notifyListeners();
    _updateStream();
  }

  // Function to update the stream with the current list of societies
  void _updateStream() {
    _societyController.add(_societies);
  }

  // Dispose the stream controller when the provider is no longer needed
  void dispose() {
    _societyController.close();
    super.dispose();
  }
}
