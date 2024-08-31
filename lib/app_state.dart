import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
    _safeInit(() {
      _firstName = prefs.getString('ff_firstName') ?? _firstName;
    });
    _safeInit(() {
      _lastName = prefs.getString('ff_lastName') ?? _lastName;
    });
    _safeInit(() {
      _userRole = prefs.getString('ff_userRole') ?? _userRole;
    });
    _safeInit(() {
      _isProfileSet = prefs.getBool('ff_isProfileSet') ?? _isProfileSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
    prefs.setBool('ff_navOpen', value);
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    prefs.setString('ff_firstName', value);
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    prefs.setString('ff_lastName', value);
  }

  String _userRole = '';
  String get userRole => _userRole;
  set userRole(String value) {
    _userRole = value;
    prefs.setString('ff_userRole', value);
  }

  bool _isProfileSet = false;
  bool get isProfileSet => _isProfileSet;
  set isProfileSet(bool value) {
    _isProfileSet = value;
    prefs.setBool('ff_isProfileSet', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
