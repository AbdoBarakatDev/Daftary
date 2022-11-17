import 'package:daftary_app/utils/app_constants.dart';

class UserModel {
  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final String? pinCode;
  final bool? isLoggedBefore;
  UserModel({
    this.isLoggedBefore,
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.pinCode,
  });
  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      id: parsedJson[userId] ?? "0",
      email: parsedJson[userEmail] ?? " ",
      name: parsedJson[userName] ?? " ",
      phone: parsedJson[userPhone] ?? " ",
      pinCode: parsedJson[userPinCode] ?? " ",
      isLoggedBefore: parsedJson[userIsLogged] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      userId: id,
      userName: name,
      userEmail: email,
      userPhone: phone,
      userPinCode: pinCode,
      userIsLogged: isLoggedBefore,
    };
  }
}
