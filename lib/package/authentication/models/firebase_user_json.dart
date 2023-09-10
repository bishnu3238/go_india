import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:go_india/utility/constant/constant.dart';


class FirebaseUserJson {
  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String gender;
  final String status;
  final String date;

  FirebaseUserJson({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.gender,
    required this.status,
    required this.date,
  });

  factory FirebaseUserJson.fromFirebase(auth.User user) => FirebaseUserJson(
      id: user.uid,
      name: user.displayName,
      image: user.photoURL,
      email: user.email,
      phone: user.phoneNumber,
      status: AuthStatus.authenticated.name,
      date: user.metadata.creationTime.toString(),
      gender: Gender.unknown.name);



  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'email': email,
        'phone': phone,
        'gender': gender,
        'status': status,
        'date': date,
      };
}
