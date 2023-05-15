import 'package:qoute_app/view/abtracts/preferences_abstract_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImp implements PreferencesAbs{
  late SharedPreferences _prefs;

  @override
  Future initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  String? getEmailUser;

  @override
  String? getUserName;

  @override
  String? getUserPhone;

  @override
  String? getUserPseudonym;

  @override
  // TODO: implement keyUserEmail
  String get keyUserEmail => _prefs.getString(keyUserEmail) ?? "";

  @override
  // TODO: implement keyUserName
  String get keyUserName => _prefs.getString(keyUserName) ?? "";

  @override
  // TODO: implement keyUserPhone
  String get keyUserPhone => _prefs.getString(keyUserPhone) ?? "";

  @override
  // TODO: implement keyUserPseudonym
  String get keyUserPseudonym => _prefs.getString(keyUserPseudonym) ?? "";

  @override
  void setEmailUser(String email) {
    _prefs.setString(keyUserEmail, email);
  }

  @override
  void setUserName(String userName) {
    _prefs.setString(keyUserName, userName);
  }

  @override
  void setUserPhone(String setUserPhone) {
    _prefs.setString(keyUserPhone, setUserPhone);
  }

  @override
  void setUserPseudonym(String userPseudonym) {
    _prefs.setString(keyUserPseudonym, userPseudonym);
  }

}