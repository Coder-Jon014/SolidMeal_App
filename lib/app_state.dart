import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _queryBeverage = 'drink';
  String get queryBeverage => _queryBeverage;
  set queryBeverage(String _value) {
    _queryBeverage = _value;
  }

  String _queryBreakfast = 'chicken';
  String get queryBreakfast => _queryBreakfast;
  set queryBreakfast(String _value) {
    _queryBreakfast = _value;
  }

  String _querySalad = 'salad';
  String get querySalad => _querySalad;
  set querySalad(String _value) {
    _querySalad = _value;
  }

  String _queryMainCourse = 'chicken';
  String get queryMainCourse => _queryMainCourse;
  set queryMainCourse(String _value) {
    _queryMainCourse = _value;
  }

  String _queryDessert = 'cake';
  String get queryDessert => _queryDessert;
  set queryDessert(String _value) {
    _queryDessert = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
