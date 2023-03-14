abstract class PreferencesAbs{
  Future initPreferences();

  final String keyUserEmail = 'keyUserEmail';
  final String keyUserName = 'keyUserName';
  final String keyUserPhone = 'keyUserPhone';
  final String keyUserPseudonym = 'keyUserPseudonym';

  //Email
  void setEmailUser(String email);
  String? getEmailUser;

  //Name
  void setUserName(String userName);
  String? getUserName;

  //Phone
  void setUserPhone(String setUserPhone);
  String? getUserPhone;

  //Pseudonym
  void setUserPseudonym(String userPseudonym);
  String? getUserPseudonym;

}