import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _AddStepModalVisible = false;
  bool get AddStepModalVisible => _AddStepModalVisible;
  set AddStepModalVisible(bool _value) {
    _AddStepModalVisible = _value;
  }

  bool _AddIngrModalVisible = false;
  bool get AddIngrModalVisible => _AddIngrModalVisible;
  set AddIngrModalVisible(bool _value) {
    _AddIngrModalVisible = _value;
  }
}
