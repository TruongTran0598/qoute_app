import 'package:qoute_app/helpers/app_laguage.dart';

extension StringExtensions on String{
  /// language
  String get tr => AppLanguage.getInstance().tr(this);

  String trParams(Map<String, dynamic> params){
    String str = tr;
    for(String key in params.keys){
      str = str.replaceAll("@$key", "${params[key]}");
    }
    return str;
  }

  String trArgs(List<dynamic> args){
    String str = tr;
    for(dynamic key in args){
      str = str.replaceFirst("%s", "$key");    /// %s là phần  tử giữ chỗ.
    }
    return str;
  }
}