import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  String _userDiet = '';
  String get userDiet => _userDiet;
  set userDiet(String _value) {
    _userDiet = _value;
  }

  List<String> _userAllergens = [];
  List<String> get userAllergens => _userAllergens;
  set userAllergens(List<String> _value) {
    _userAllergens = _value;
  }

  void addToUserAllergens(String _value) {
    _userAllergens.add(_value);
  }

  void removeFromUserAllergens(String _value) {
    _userAllergens.remove(_value);
  }

  void removeAtIndexFromUserAllergens(int _index) {
    _userAllergens.removeAt(_index);
  }

  void updateUserAllergensAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userAllergens[_index] = updateFn(_userAllergens[_index]);
  }

  void insertAtIndexInUserAllergens(int _index, String _value) {
    _userAllergens.insert(_index, _value);
  }

  List<String> _userIngredientDislikes = [];
  List<String> get userIngredientDislikes => _userIngredientDislikes;
  set userIngredientDislikes(List<String> _value) {
    _userIngredientDislikes = _value;
  }

  void addToUserIngredientDislikes(String _value) {
    _userIngredientDislikes.add(_value);
  }

  void removeFromUserIngredientDislikes(String _value) {
    _userIngredientDislikes.remove(_value);
  }

  void removeAtIndexFromUserIngredientDislikes(int _index) {
    _userIngredientDislikes.removeAt(_index);
  }

  void updateUserIngredientDislikesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userIngredientDislikes[_index] = updateFn(_userIngredientDislikes[_index]);
  }

  void insertAtIndexInUserIngredientDislikes(int _index, String _value) {
    _userIngredientDislikes.insert(_index, _value);
  }
}
