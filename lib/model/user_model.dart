import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class UserModel {
  String phone;
  String name;
  String passWord;
  String email;
  String accountType;

  UserModel({
    this.name = '',
    this.email = '',
    this.passWord = '',
    this.accountType = '',
    this.phone ='',
  });

  /*
   * Save use in storage.
   */
  void save() async {
    final storage = SharedPreferences.getInstance();
    var js = this.toJson();
    String serializedUser = json.encode(js);
    await storage.then((value) {
      value.setString( 'user', serializedUser);
    });
  }

  /*
   * Load user from storage.
   */
  static Future<UserModel> load() async {
    try {
      final storage =  SharedPreferences.getInstance();
      String serializedUser ="";
      await storage.then((value){
        serializedUser=  value.getString('user')!;
      });
      return parseFromStorage(json.decode(serializedUser));
    } catch (e) {
      return UserModel();
    }
  }

  /*
   * remove user from storage.
   */
  static Future<bool> remove() async {
    try {
      final storage = SharedPreferences.getInstance();
      storage.then((value) {
        value.remove('user');
      });
      return true;
    } catch (exception) {
      return false;
    }
  }

  static UserModel parseFromStorage(
      Map<String, dynamic> json,
      ) {
    return UserModel(
        phone: json['phone'],
        name: json['name'],
        passWord: json['password'],
        email: json['email'],
      accountType: json['accountType'],
    );
  }



  Map<String, dynamic> toJson() => {
    'name': this.name,
    'email': this.email,
    'password': this.passWord,
    'accountType': this.accountType,
    'phone': this.phone,

  };
}